#!/bin/bash

# 1. Tentukan lokasi folder tempat file xmrig berada
# Ubah jika path folder Anda berbeda
MINER_DIR="$HOME/bmxmrig"

# Masuk ke direktori
cd "$MINER_DIR" || exit

# 2. Pastikan file biner memiliki izin eksekusi
chmod +x xmrig 2>/dev/null || chmod +x xmrig-notls 2>/dev/null

# 3. Konfigurasi Mining (Silakan UBAH sesuai pool & dompet Anda)
POOL="://unmineable.com"
WALLET="DOGE:DBRq92n3QQyFNkjke4wza1UWPC6jXYeSbD.Worker01"
COIN="monero-rx"

# 4. Jalankan miner
echo "=== Menjalankan bmxmrig ==="
if [ -f "./xmrig" ]; then
    ./xmrig -o "$POOL" -u "$WALLET" -k --coin "$COIN"
elif [ -f "./xmrig-notls" ]; then
    ./xmrig-notls -o "$POOL" -u "$WALLET" -k --coin "$COIN"
else
    echo "Gagal menemukan file eksekusi xmrig atau xmrig-notls di $MINER_DIR"
fi
