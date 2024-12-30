#!/bin/bash


echo "Updating system..."
sudo apt update -y && sudo apt upgrade -y


echo "Installing Python3 and pip..."
sudo apt install -y python3 python3-pip


echo "Creating a new user 'kashira' with sudo privileges..."
sudo useradd -m -s /bin/bash -G sudo kashira
echo "Setting default password for 'kashira'..."
echo "kashira:3&Zm.x#?h3c2Qs@" | sudo chpasswd


echo "Installing XFCE desktop environment..."
sudo apt install -y xfce4 xfce4-goodies


echo "Installing LightDM display manager..."
sudo apt install -y lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm


echo "Installing qBittorrent..."
sudo apt install -y qbittorrent


echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb


echo "Downloading and installing Telegram Desktop..."
wget --header="User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36" \
-O telegram.tar.xz "https://telegram.org/dl/desktop/linux"
tar -xf telegram.tar.xz
sudo mv Telegram /opt/
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram-desktop


echo "Installing 7zip..."
sudo apt install -y p7zip-full


echo "Cleaning up installation files..."
sudo rm -rf google-chrome-stable_current_amd64.deb telegram.tar.xz
sudo apt autoremove -y
sudo apt clean


echo "Rebooting the system in 10 seconds... Press Ctrl+C to cancel."
sleep 10
sudo reboot
