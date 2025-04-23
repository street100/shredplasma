# Import Custom KDE Plasma Setup
# Run in root shell fucking moron

echo "Installing Shred's kdeplasma setup..."
echo "None of these things are mine, with the exception of the color scheme, lol. Credits go to:"
echo "phob1an @ opencode.net              - psion global theme and elements,"
echo "|-->                                  plus nimbus window decorations"
echo ""
echo "eudaimon @ git.disroot.org          - buuf icons for many desktops"
echo "mattahan & aroche @ deviantart.com  - original buuf cursors, then animated"
echo "Charles O'Rear, January 1998. bliss - background, windows xp bliss"
echo ""
read -p "Enter username: " USER
home=/home/$user
location=/home/$USER/themefiles
mkdir /home/$USER/themefiles
cd /home/$USER/themefiles

echo "Getting files..."
wget https://www.opencode.net/phob1an/psion/-/archive/master/psion-master.tar.gz -P $location
git clone https://git.disroot.org/eudaimon/buuf-nestort.git $location/buuf-icons/
git clone https://github.com/street100/shredplasma/blob/main/themefiles/Soil.colors $location/color-scheme
git clone https://github.com/street100/shredplasma/blob/main/themefiles/nimbus-aurorae.tar.xz $location
git clone https://github.com/street100/shredplasma/blob/main/themefiles/buuf-cursors.tgz $location
echo "Extracting..."
tar -xvzf $location/psion-master.tar.gz -C $location
tar -xvzf $location/nimbus-aurorae.tar.xz -C $location/aurorae
echo "Copying parts to their locations..."
echo "Global Theme first..."
cp -r $location/psion-master/look-and-feel /usr/share/plasma/
echo "Icons..."
cp -r $location/buuf-icons /usr/share/icons
echo "Cursors..."
cp -r $location/buuf-cursors /usr/share/icons
echo "Window decoration..."
cp -r $location/aurorae/ /usr/share/aurorae/themes
echo "Color scheme..."
cp -r $location/color-scheme/Soil.colors /usr/share/color-schemes/

echo "Applying settings..."
lookandfeeltool -a org.magpie.psion.desktop
plasma-apply-colorscheme /usr/share/color-schemes/Soil.colors

echo "Copying over windows xp bliss..."
git clone https://github.com/street100/shredplasma/blob/main/themefiles/windows-xp-bliss-4k-lu-1920x1080.jpg $location/Wallpapers/
echo "Applying bliss..."
plasma-apply-wallpaperimage $location/Wallpapers/windows-xp-bliss-4k-lu-1920x1080.jpg

echo "Make sure you apply the Window Decoration Manually, as KDE Plasma has not yet made a command for it."
echo "Make sure you apply the installed cursors manually, as there has yet to be a command for it."
echo "Make sure to also manually set desktop sounds, splash screen, and lock screen"
read -p "do so, and then come back and hit enter to install sddm theme."

echo "Installing theme, Terminal Style Login..."
git clone https://github.com/GistOfSpirit/TerminalStyleLogin $location/TerminalStyleLogin
echo "building..."
sh $location/TerminalStyleLogin/scripts/build.sh
echo "Done building."
echo "Copying to location..."
cp -r $location/TerminalStyleLogin /usr/share/sddm/themes/
echo "Setting default theme..."
sed -i "s/Current=/Current=TerminalStyleLogin/" /usr/lib/sddm/sddm.conf.d/default.conf
echo "Done. Set."
echo ""
read -p "All done. Hit enter to finish."
