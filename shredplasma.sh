# Import Custom KDE Plasma Setup
# Run in root shell fucking moron

echo "Installing Psion as the Global Theme..."
cp /run/media/shea/move-speed/theme/plasma/global/org.magpie.psion.desktop ~/.local/share/plasma/look-and-feel/
lookandfeeltool -a org.magpie.psion.desktop

echo "Copying over Wallpapers..."
cp /run/media/shea/move-speed/theme/Wallpapers/ ~/
echo "Applying bliss..."
plasma-apply-wallpaperimage ~/Wallpapers/windows-xp-bliss-4k-lu-1920x1080.jpg

echo "Copying color scheme..."
cp /run/media/shea/move-speed/theme/color-schemes/Soil.colors /usr/share/color-schemes/
echo "Setting Soil Color Scheme..."
plasma-apply-colorscheme /usr/share/color-schemes/Soil.colors

echo "Copying Window Decoration..."
cp /run/media/shea/move-speed/theme/plasma/aurorae/ ~/.local/share/aurorae/themes/
echo "Make sure you apply the Window Decoration Manually, as KDE Plasma has not yet made a command for it."

echo "Copying Cursors..."
cp /run/media/shea/move-speed/theme/plasma/cursor/buuf-cursor-original-48-a ~/.icons/
echo "Make sure you apply the installed cursors manually, as there has yet to be a command for it."

echo "Make sure to also manually set desktop sounds, splash screen, and lock screen"
read -p "do so, and then come back and hit enter to install sddm theme."

echo "Installing sddm Theme, Terminal Style..."
cp /run/media/shea/move-speed/theme/sddm/TerminalStyleLogin /usr/share/sddm/themes/
sed -i "s/Current=/Current=TerminalStyleLogin/" /usr/lib/sddm/sddm.conf.d/default.conf

echo "Fuck you. Done."
