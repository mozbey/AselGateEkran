#!/bin/sh
# AselGate Ekran - kaldirma (ayarlar ~/.config/aselgate-ekran.json korunur).
rm -rf "$HOME/.local/share/aselgate-ekran"
rm -f "$HOME/.local/bin/aselgate-ekran" "$HOME/.local/share/applications/aselgate-ekran.desktop" "$HOME/.config/autostart/aselgate-ekran.desktop"
echo "AselGate Ekran kaldirildi."