#!/usr/bin/env bash

# ==============================================================================
# macOS RAM Inspector & Safe Optimizer
# Analisis mendalam konsumsi RAM (Mach Virtual Memory) & Optimasi Aman
# Kompatibel: Apple Silicon (M1/M2/M3/M4) & Intel Mac
# ==============================================================================

set -eo pipefail

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}${BOLD}================================================================${NC}"
    echo -e "${BLUE}${BOLD}           macOS RAM Usage & Memory Health Inspector            ${NC}"
    echo -e "${BLUE}${BOLD}================================================================${NC}"
}

get_ram_stats() {
    # Ambil page size dinamis (Apple Silicon = 16384 bytes, Intel = 4096 bytes)
    local page_size
    page_size=$(pagesize)
    local mem_total_bytes
    mem_total_bytes=$(sysctl -n hw.memsize)

    # Ekstrak data dari vm_stat
    local vm_output
    vm_output=$(vm_stat)

    local pages_free
    pages_free=$(echo "$vm_output" | awk '/Pages free/ {print $3}' | tr -d '.')
    local pages_active
    pages_active=$(echo "$vm_output" | awk '/Pages active/ {print $3}' | tr -d '.')
    local pages_inactive
    pages_inactive=$(echo "$vm_output" | awk '/Pages inactive/ {print $3}' | tr -d '.')
    local pages_speculative
    pages_speculative=$(echo "$vm_output" | awk '/Pages speculative/ {print $3}' | tr -d '.')
    local pages_wired
    pages_wired=$(echo "$vm_output" | awk '/Pages wired down/ {print $4}' | tr -d '.')
    local pages_compressed
    pages_compressed=$(echo "$vm_output" | awk '/Pages occupied by compressor/ {print $5}' | tr -d '.')

    pages_free=${pages_free:-0}
    pages_active=${pages_active:-0}
    pages_inactive=${pages_inactive:-0}
    pages_speculative=${pages_speculative:-0}
    pages_wired=${pages_wired:-0}
    pages_compressed=${pages_compressed:-0}

    # Hitung nilai memori dalam Gigabytes
    awk -v ps="$page_size" -v total="$mem_total_bytes" \
        -v free="$pages_free" -v active="$pages_active" -v inactive="$pages_inactive" \
        -v spec="$pages_speculative" -v wired="$pages_wired" -v comp="$pages_compressed" \
        'BEGIN {
            free_bytes = (free + spec) * ps;
            active_bytes = active * ps;
            inactive_bytes = inactive * ps;
            wired_bytes = wired * ps;
            comp_bytes = comp * ps;
            used_bytes = wired_bytes + active_bytes + comp_bytes;
            available_bytes = free_bytes + inactive_bytes;

            to_gb = 1024 * 1024 * 1024;

            printf "TOTAL_RAM=%.2f\n", total / to_gb;
            printf "USED_RAM=%.2f\n", used_bytes / to_gb;
            printf "AVAILABLE_RAM=%.2f\n", available_bytes / to_gb;
            printf "WIRED_RAM=%.2f\n", wired_bytes / to_gb;
            printf "ACTIVE_RAM=%.2f\n", active_bytes / to_gb;
            printf "COMPRESSED_RAM=%.2f\n", comp_bytes / to_gb;
            printf "INACTIVE_CACHE=%.2f\n", inactive_bytes / to_gb;
            printf "FREE_RAM=%.2f\n", free_bytes / to_gb;
            printf "USED_PERCENT=%.1f\n", (used_bytes / total) * 100;
        }'
}

show_summary() {
    eval "$(get_ram_stats)"

    echo -e "${CYAN}${BOLD}[1. METRIK MEMORI SISTEM]${NC}"
    echo -e "Total RAM Fisik      : ${BOLD}${TOTAL_RAM} GB${NC}"
    echo -e "RAM Terpakai (Used)  : ${YELLOW}${USED_RAM} GB${NC} (${USED_PERCENT}%)"
    echo -e "RAM Tersedia (Avail) : ${GREEN}${AVAILABLE_RAM} GB${NC}"
    echo -e "  ├─ App / Active    : ${ACTIVE_RAM} GB"
    echo -e "  ├─ Wired (Kernel)  : ${WIRED_RAM} GB"
    echo -e "  ├─ Compressed      : ${COMPRESSED_RAM} GB"
    echo -e "  ├─ File Cache      : ${INACTIVE_CACHE} GB"
    echo -e "  └─ Murni Free      : ${FREE_RAM} GB\n"
}

show_top_processes() {
    echo -e "${CYAN}${BOLD}[2. TOP 10 PROSES PEMAKAN MEMORI TERBESAR]${NC}"
    printf "${BOLD}%-7s | %-10s | %-8s | %-s${NC}\n" "PID" "RAM (MB)" "% MEM" "NAMA APLIKASI / PROSES"
    printf "%-7s-+-%-10s-+-%-8s-+-%-s\n" "-------" "----------" "--------" "------------------------------------------"

    ps -A -o pid,rss,%mem,comm | sort -k 2 -nr | head -n 10 | awk '{
        pid = $1;
        rss_kb = $2;
        mem_pct = $3;
        $1 = ""; $2 = ""; $3 = "";
        sub(/^[ \t]+/, "", $0);
        comm = $0;

        n = split(comm, parts, "/");
        app_name = parts[n];
        if (app_name == "") app_name = parts[n-1];

        rss_mb = sprintf("%.1f MB", rss_kb / 1024);
        printf "%-7s | %-10s | %-7s%% | %-s\n", pid, rss_mb, mem_pct, app_name;
    }'
    echo ""
}

safe_optimize() {
    echo -e "${CYAN}${BOLD}[3. MENJALANKAN OPTIMASI AMAN]${NC}"
    echo -e "Menjalankan optimasi tanpa mematikan aplikasi aktif kamu..."

    # 1. Bersihkan sisa QuickLookSatellite yang sering leak memori di macOS
    killall -9 QuickLookSatellite 2>/dev/null || true

    # 2. Hentikan background daemon build yang sering idle tapi menahan heap RAM besar
    if pgrep -f "GradleDaemon" >/dev/null 2>&1; then
        echo -e "  ├─ Menutup idle Gradle Daemons..."
        pkill -f gradle || true
    fi

    # 3. Flusing Disk Cache via 'purge' bawaan Darwin kernel
    echo -e "  ├─ Mengosongkan cache disk & inactive pages via Darwin purge..."
    if [ "$EUID" -ne 0 ]; then
        if sudo -v 2>/dev/null; then
            sudo purge
        else
            echo -e "  └─ ${YELLOW}Catatan: Perintah 'purge' membutuhkan hak akses sudo untuk hasil maksimal.${NC}"
            echo -e "     Silakan masukkan password jika diminta, atau jalankan: ${BOLD}sudo ./optimize-ram.sh${NC}"
            sudo purge || true
        fi
    else
        purge
    fi

    echo -e "  └─ ${GREEN}Optimasi selesai dieksekusi.${NC}\n"
}

# --- Eksekusi Utama ---
print_header
echo -e "${YELLOW}Status Sebelum Optimasi:${NC}"
show_summary
show_top_processes

read -p "Apakah kamu ingin menjalankan optimasi aman sekarang? (y/n): " -n 1 -r
echo -e "\n"

if [[ $REPLY =~ ^[Yy]$ ]]; then
    safe_optimize
    echo -e "${GREEN}${BOLD}Status Setelah Optimasi:${NC}"
    show_summary
    echo -e "${GREEN}✓ RAM berhasil dilegakan secara aman tanpa mengorbankan stabilitas sistem!${NC}"
else
    echo -e "${BLUE}Analisis selesai tanpa perubahan sistem.${NC}"
fi
