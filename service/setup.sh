#! /bin/bash
sudo bash -c "echo gs_usb >> /etc/modules"
sudo cp CAN.service /usr/lib/systemd/system/

cp Sleipnir.desktop ~/Desktop

chmod +x ~/Desktop/Sleipnir.desktop
chmod +x Sleipnir
sudo cp Sleipnir /usr/local/bin
sudo cp Sleipnir.svg /usr/share/icons/Sleipnir.svg

sudo systemctl daemon-reload
sudo systemctl enable CAN.service 