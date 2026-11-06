#!/usr/bin/env bash

# ==============================================================================
# Comprehensive Cleanup & Maintenance Script
# Target: React Native / Expo / Android / iOS / Package Managers / macOS System
# ==============================================================================

set -eo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Memulai Pembersihan Lingkungan Pengembangan ===${NC}\n"

# 1. Android & Gradle Global Cache
echo -e "${YELLOW}[1/5] Mematikan Gradle daemon & membersihkan cache Android...${NC}"
pkill -f gradle || true
rm -rf \
    "$HOME/.gradle/caches" \
    "$HOME/.gradle/daemon" \
    "$HOME/.gradle/wrapper/dists" \
    "$HOME/.android/build-cache" \
    "$HOME/.android/cache"
echo -e "${GREEN}✓ Cache Gradle & Android bersih.${NC}\n"

# 2. iOS, Xcode, & CocoaPods
echo -e "${YELLOW}[2/5] Membersihkan cache Xcode, CocoaPods, & Simulator unavailable...${NC}"
rm -rf \
    "$HOME/Library/Developer/Xcode/DerivedData" \
    "$HOME/Library/Developer/Xcode/iOS DeviceSupport" \
    "$HOME/Library/Caches/com.apple.dt.Xcode"

if command -v pod >/dev/null 2>&1; then
    pod cache clean --all || true
fi

if command -v xcrun >/dev/null 2>&1; then
    xcrun simctl delete unavailable 2>/dev/null || true
fi
echo -e "${GREEN}✓ Cache iOS & Xcode bersih.${NC}\n"

# 3. JavaScript Bundler & Temporary Maps
echo -e "${YELLOW}[3/5] Membersihkan cache Metro bundler & haste-map...${NC}"
rm -rf "$TMPDIR/metro-*" "$TMPDIR/haste-map-*" 2>/dev/null || true
echo -e "${GREEN}✓ Cache Metro bundler bersih.${NC}\n"

# 4. Node Package Managers (NPM, NPX, Yarn)
echo -e "${YELLOW}[4/5] Membersihkan cache NPM, NPX, dan Yarn...${NC}"
rm -rf "$HOME/.npm/_npx"
if command -v npm >/dev/null 2>&1; then
    npm cache clean --force 2>/dev/null || true
fi

if command -v yarn >/dev/null 2>&1; then
    yarn cache clean --all 2>/dev/null || yarn cache clean 2>/dev/null || true
fi
echo -e "${GREEN}✓ Cache NPM, NPX, dan Yarn bersih.${NC}\n"

# 5. Homebrew Maintenance
echo -e "${YELLOW}[5/5] Menjalankan pembersihan Homebrew (autoremove & cleanup)...${NC}"
if command -v brew >/dev/null 2>&1; then
    brew autoremove || true
    brew cleanup --prune=all -s || true
    echo -e "${GREEN}✓ Cache Homebrew bersih.${NC}\n"
else
    echo "Homebrew tidak ditemukan, melewati tahap ini."
fi

echo -e "${BLUE}=== Pembersihan Selesai! Semua cache berhasil dikosongkan. ===${NC}"
