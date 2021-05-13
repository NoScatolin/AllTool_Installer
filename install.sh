#!/bin/bash
echo -e '\e[36m[+] Instalando as seguintes ferramentas: \e[39m'
echo ''
echo -e '\e[36m ◉ Net-Tools, Nmap, Telnet, cURL, NetCat, Plank, SQLmap, Java, Python, Golang, Pip, Impacket, aMASS, Enum4Linux, HTTProbe, EyeWitness, massRECON, John, AirCrack-NG, Extract, ExifTool, WhoIs, Dirb, Nikto, Sublime Text, NBTScan, GoBuster, Samba, SMBClient, Flameshot, Hakrawler, Snap... \e[39m'
echo ''


## Efetuando os downloads e a instalação das ferramentas ##
apt update && apt upgrade -y
apt autoremove -y
apt install net-tools nmap telnet curl netcat plank sqlmap default-jre default-jdk python3 golang john aircrack-ng extract exiftool whois dirb nikto nbtscan gobuster samba smbclient flameshot snapd -y
apt update && apt upgrade -y
apt autoremove -y
apt install python3-pip
pip3 install impacket
snap install amass
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt update && apt install sublime-text -y


## Indo para o diretório /usr/share ##
cd /usr/share/


## Fazendo o download das ferramentas a partir do GitHub ##
git clone https://github.com/CiscoCXSecurity/enum4linux
git clone https://github.com/tomnomnom/httprobe
git clone https://github.com/FortyNorthSecurity/EyeWitness
git clone https://github.com/xcatolin/massRECON


##  Efetuando a instalação do Hakrawler ##
go get github.com/hakluke/hakrawler
echo "alias hakrawler='~/go/bin/hakrawler'" >> ~/.bashrc

## Efetuando a instalação do HTTProbe ##
cd httprobe
go build main.go
mv main httprobe


## Efetuando a instalação do EyeWitness ##
cd ..
mv EyeWitness/ eyewitness


## Adicionando os alias das ferramentas no bashrc ##
echo "alias httprobe='cd /usr/share/httprobe/ && ./httprobe'
alias enum4linux='cd /usr/share/enum4linux/ && perl enum4linux.pl'
alias eyewitness='cd /usr/share/eyewitness/Python/ && python3 EyeWitness.py'
alias recon='cd /usr/share/massRECON/ && bash recon.sh'" >> ~/.bashrc


## Efetuando a última atualização ##
apt update && apt upgrade -y
apt autoremove -y

echo -e '\e[36m[*] Instalações e Atualizações concluídas! \e[39m'
