#!/bin/bash
# =========================================
# Ghostface-Bytes PNPT Setup Script
# =========================================
# Preparación de entorno para PNPT - TCM Academy
# Herramientas necesarias para presentar y practicar PNPT
# Uso ético solamente.
# =========================================

RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
BLUE="\e[94m"
RESET="\e[0m"

clear
echo -e "${RED}"
cat << "EOF"
#  $$$$$$$\  $$\   $$\ $$$$$$$\  $$$$$$$$\ 
#  $$  __$$\ $$$\  $$ |$$  __$$\ \__$$  __|
#  $$ |  $$ |$$$$\ $$ |$$ |  $$ |   $$ |   
#  $$$$$$$  |$$ $$\$$ |$$$$$$$  |   $$ |   
#  $$  ____/ $$ \$$$$ |$$  ____/    $$ |   
#  $$ |      $$ |\$$$ |$$ |         $$ |   
#  $$ |      $$ | \$$ |$$ |         $$ |   
#  \__|      \__|  \__|\__|         \__|   
#                                          
#                                          
#                                                                                                                                                                                                                                                                                                                          
EOF
echo -e "${GREEN}[+] Preparación de entorno PNPT - TCM Academy${RESET}"
echo -e "${YELLOW}[+] Herramientas necesarias para presentar y practicar PNPT${RESET}"
sleep 3

# =========================================
# 1. Actualización del sistema
# =========================================
echo -e "${YELLOW}[+] Actualizando sistema y repositorios extra...${RESET}"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
sudo apt install -y software-properties-common apt-transport-https
sudo add-apt-repository universe
sudo apt update

# =========================================
# 2. Instalación de Java y entorno Python
# =========================================
echo -e "${YELLOW}[+] Instalando Java y entorno Python...${RESET}"
sudo apt install -y default-jdk default-jre python3 python3-pip python3-venv

# =========================================
# 3. Herramientas esenciales + Web Pentest
# =========================================
echo -e "${YELLOW}[+] Instalando herramientas esenciales...${RESET}"
sudo apt install -y git curl wget unzip tmux openvpn net-tools \
    build-essential cmake golang gobuster dirb dirsearch \
    nmap rustscan smbclient enum4linux bloodhound neo4j \
    responder impacket-scripts evil-winrm hydra john hashcat \
    seclists wfuzz sqlmap nikto whatweb wafw00f \
    burpsuite metasploit-framework exploitdb

# =========================================
# 4. Herramientas AD y Post-explotación
# =========================================
echo -e "${YELLOW}[+] Instalando herramientas AD y post-explotación...${RESET}"
git clone https://github.com/BloodHoundAD/BloodHound /opt/BloodHound
git clone https://github.com/fox-it/mitm6.git /opt/mitm6
git clone https://github.com/gentilkiwi/mimikatz.git /opt/mimikatz


# =========================================
# 5. Scripts de enumeración
# =========================================
mkdir -p /opt/postex
git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/postex/PowerSploit
git clone https://github.com/carlospolop/PEASS-ng.git /opt/postex/PEASS-ng
git clone https://github.com/rebootuser/LinEnum.git /opt/postex/LinEnum

# =========================================
# 6. Wordlists
# =========================================
echo -e "${YELLOW}[+] Descargando diccionarios...${RESET}"
mkdir -p /opt/wordlists
cd /opt/wordlists
git clone https://github.com/danielmiessler/SecLists.git
wget https://github.com/berzerk0/Probable-Wordlists/archive/refs/heads/master.zip -O probable.zip
unzip probable.zip && rm probable.zip
cp /usr/share/wordlists/rockyou.txt.gz . && gunzip rockyou.txt.gz

# =========================================
# 7. Actualizaciones de herramientas
# =========================================
echo -e "${YELLOW}[+] Actualizando Metasploit, searchsploit y msfvenom...${RESET}"
msfupdate
searchsploit -u


echo -e "${GREEN}[✓] Instalación completada. PNPT Ready - Ghostface-Bytes${RESET}"
