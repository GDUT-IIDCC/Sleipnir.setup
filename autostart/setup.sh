#! /bin/bash
sudo bash -c "echo gs_usb >> /etc/modules"
sudo cp *.service /etc/systemd/system/
sudo cp panel.desktop ~/Desktop
sudo chmod +x ~/Desktop/panel.desktop
cp launch_ui.sh ~/
sudo cp spongebob.png /usr/share/icons/hicolor/512x512/apps/spongebob.png
sudo systemctl daemon-reload
sudo systemctl enable can.service 
# 暂时不启用后台roscore
# sudo systemctl enable roscore.service
