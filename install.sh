#!/bin/sh
# AselGate Ekran - Linux kurulumu (kullanici duzeyinde, root gerekmez).
# Kullanim:  sh install.sh             (masaustu girdisi)
#            sh install.sh --autostart (ayrica oturum acilisinda otomatik baslat)
set -e
DIR=$(cd "$(dirname "$0")" && pwd)
APP_DIR="$HOME/.local/share/aselgate-ekran"
BIN_DIR="$HOME/.local/bin"
APPS_DIR="$HOME/.local/share/applications"

if [ ! -f "$DIR/aselgate-ekran" ]; then
  echo "HATA: aselgate-ekran dosyasi bu klasorde yok."; exit 1
fi

mkdir -p "$APP_DIR" "$BIN_DIR" "$APPS_DIR"
cp "$DIR/aselgate-ekran" "$DIR/aselgate-ekran.svg" "$APP_DIR/"
chmod 755 "$APP_DIR/aselgate-ekran"
ln -sf "$APP_DIR/aselgate-ekran" "$BIN_DIR/aselgate-ekran"

# masaustu / uygulama menusu girdisi
cat > "$APPS_DIR/aselgate-ekran.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=AselGate Ekran
Comment=AselGate iGate'inden duyulan istasyonlar, pusula ve son depremler
Exec=$APP_DIR/aselgate-ekran
Icon=$APP_DIR/aselgate-ekran.svg
Terminal=false
Categories=Network;HamRadio;Utility;
StartupWMClass=AselGateEkran
EOF

if [ "$1" = "--autostart" ]; then
  mkdir -p "$HOME/.config/autostart"
  cp "$APPS_DIR/aselgate-ekran.desktop" "$HOME/.config/autostart/"
  echo "Oturum acilisinda otomatik baslatma ayarlandi."
fi

echo "Kurulum tamam. Uygulama dosyasi: $APP_DIR"
echo "Baslatmak icin: aselgate-ekran  (ya da uygulama menusunde 'AselGate Ekran')"
echo "Ilk acilista AselGate adresini ayarlar ekranindan girin (varsayilan 192.168.1.163)."
