#!/usr/bin/env sh

sudo sed -i "2i export XMODIFIERS=\"@im=fcitx\"\nexport QT_IM_MODULE=\"fcitx\"" /usr/bin/wps
sudo sed -i "2i export XMODIFIERS=\"@im=fcitx\"\nexport QT_IM_MODULE=\"fcitx\"" /usr/bin/wpp
sudo sed -i "2i export XMODIFIERS=\"@im=fcitx\"\nexport QT_IM_MODULE=\"fcitx\"" /usr/bin/et
