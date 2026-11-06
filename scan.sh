#!/usr/bin/env bash

# ==============================================================================
# macOS Disk Usage Inspector & Analyzer
# Menemukan dan mengurutkan folder terbesar di direktori root user ($HOME)
# Menampilkan: Ukuran (Human-Readable), Nama Folder, dan Path Lengkap
# ==============================================================================

set -e

# Warna output terminal
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Parameter Input (Dapat di-override via argumen terminal)
# Argumen 1: Target direktori (default: $HOME)
# Argumen 2: Depth level folder (default: 1)
# Argumen 3: Jumlah folder yang ditampilkan (default: 15)
TARGET_DIR="${1:-$HOME}"
DEPTH="${2:-1}"
LIMIT="${3:-15}"

echo -e "${BLUE}${BOLD}================================================================${NC}"
echo -e "${BLUE}${BOLD}        macOS Storage Inspector - Top Folders Analyzer          ${NC}"
echo -e "${BLUE}${BOLD}================================================================${NC}"
echo -e "${CYAN}Target Direktori :${NC} $TARGET_DIR"
echo -e "${CYAN}Scanning Depth   :${NC} Max-depth $DEPTH (folder level)"
echo -e "${CYAN}Menampilkan Top  :${NC} $LIMIT folder terbesar\n"
echo -e "${YELLOW}Sedang memindai ukuran folder (proses ini butuh beberapa detik)...${NC}"

# Validasi direktori
if [ ! -d "$TARGET_DIR" ]; then
    echo -e "\033[0;31mError: Direktori '$TARGET_DIR' tidak ditemukan!\033[0m" >&2
    exit 1
fi

# Header Tabel
printf "\n${BOLD}%-12s | %-28s | %-s${NC}\n" "UKURAN" "NAMA FOLDER" "LOKASI LENGKAP"
printf "%-12s-+-%-28s-+-%-s\n" "------------" "----------------------------" "----------------------------------------------------"

# Pipeline Pemindaian & Formatting
du -k -d "$DEPTH" "$TARGET_DIR" 2>/dev/null | sort -rn | awk -v limit="$LIMIT" -v target="$TARGET_DIR" '
function human(k) {
    if (k >= 1073741824) return sprintf("%.2f TB", k / 1073741824);
    if (k >= 1048576)    return sprintf("%.2f GB", k / 1048576);
    if (k >= 1024)       return sprintf("%.2f MB", k / 1024);
    return sprintf("%d KB", k);
}
BEGIN {
    count = 0;
}
{
    kb = $1;
    $1 = "";
    sub(/^[ \t]+/, "", $0);
    path = $0;

    # Abaikan entri root itu sendiri agar hanya menampilkan folder anaknya
    if (path == target || path == (target "/") || path == ".") {
        next;
    }

    count++;
    if (count > limit) {
        exit;
    }

    # Ekstrak nama folder (basename)
    n = split(path, parts, "/");
    folder_name = parts[n];
    if (folder_name == "") {
        folder_name = parts[n - 1];
    }

    # Batasi panjang nama folder untuk kerapian tabel
    display_name = folder_name;
    if (length(display_name) > 26) {
        display_name = substr(display_name, 1, 23) "...";
    }

    size_str = human(kb);
    printf "%-12s | %-28s | %-s\n", size_str, display_name, path;
}
'

echo -e "\n${GREEN}✓ Pemindaian selesai.${NC}"
echo -e "${CYAN}Tips:${NC} Kamu bisa atur kedalaman folder (depth) dan jumlah baris."
echo -e "Contoh: ${BOLD}./scan-storage.sh ~ 2 20${NC} (Memindai subfolder kedalaman 2, tampilkan 20 terbesar)\n"
