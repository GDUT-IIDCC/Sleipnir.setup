#! /bin/bash
sudo gs_usb >> /etc/modules
sudo cp *.service /etc/systemd/system/
sudo cp panel.desktop ~/Desktop
chmod +x ~/Desktop/panel.desktop
cp launch_ui.sh ~/
sudo cp s.png /usr/share/icons/hicolor/512x512/apps/sleipnir.png
sudo systemctl daemon-reload
sudo systemctl enable can.service 
sudo systemctl enable roscore.service
