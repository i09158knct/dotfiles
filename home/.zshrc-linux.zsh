xmodmap .Xmodmap.ubuntu
ln -fs ~/.sublime/User \
       ~/.config/sublime-text-2/Packages/User
ln -fs ~/.sublime/User/themes/flatland \
       ~/.config/sublime-text-2/Packages/Theme\ -\ Flatland
function subl() {
  ~/Applications/Sublime\ Text\ 2/sublime_text $@ &
}
