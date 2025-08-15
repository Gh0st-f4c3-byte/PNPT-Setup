#!/bin/bash
# =========================================
# PNPT Setup Script - Ghostface_Byte Edition
# =========================================
# Prepara Kali Linux para entrenamiento PNPT de TCM Academy
# Incluye herramientas AD, Web, OSINT, explotación, post-explotación y reportes
# =========================================

RED="\e[91m"
GREEN="\e[92m"
YELLOW="\e[93m"
BLUE="\e[94m"
RESET="\e[0m"

echo -e "${BLUE}"
cat << "EOF"
   ____                _   __         __        ____         
  / __ \___  ___ ___  / | / /__  ____/ /__     / __ \____ ___ 
 / / / / _ \/ __ `__ \/  |/ / _ \/ __  / _ \   / /_/ / __ `__ \
/ /_/ /  __/ / / / / / /|  /  __/ /_/ /  __/  / ____/ / / / / /
\____/\___/_/ /_/ /_/_/ |_/\___/\__,_/\___/  /_/   /_/ /_/ /_/ 
                                                              
        PNPT Kali Setup - Ghostface_Byte
EOF
echo -e "${RESET}"

# =========================================
# 1. Actualizar sistema
# =========================================
echo -e "${YELLOW}[+] Actualizando sistema...${RESET}"
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y

# =========================================
# 2. Herramientas esenciales
# =========================================
echo -e "${YELLOW}[+] Instalando herramientas esenciales...${RESET}"
sudo apt install -y git curl wget unzip tmux python3-pip openvpn net-tools \
    build-essential cmake golang gobuster dirb dirsearch \
    nmap rustscan smbclient enum4linux crackmapexec bloodhound neo4j \
    responder impacket-scripts evil-winrm hydra john hashcat \
    seclists wfuzz sqlmap nikto whatweb wafw00f \
    burpsuite

# =========================================
# 3. Herramientas OSINT
# =========================================
echo -e "${YELLOW}[+] Instalando herramientas OSINT...${RESET}"
pip3 install theHarvester shodan

# =========================================
# 4. Herramientas de enumeración AD
# =========================================
echo -e "${YELLOW}[+] Instalando herramientas Active Directory...${RESET}"
sudo apt install -y ldap-utils crackmapexec
git clone https://github.com/BloodHoundAD/BloodHound /opt/BloodHound
git clone https://github.com/dirkjanm/PrivExchange.git /opt/PrivExchange
git clone https://github.com/fox-it/mitm6.git /opt/mitm6

# =========================================
# 5. Post-Explotación Windows y Linux
# =========================================
echo -e "${YELLOW}[+] Descargando scripts de post-explotación...${RESET}"
mkdir -p /opt/postex
git clone https://github.com/PowerShellMafia/PowerSploit.git /opt/postex/PowerSploit
git clone https://github.com/411Hall/JAWS.git /opt/postex/JAWS
git clone https://github.com/carlospolop/PEASS-ng.git /opt/postex/PEASS-ng
git clone https://github.com/rebootuser/LinEnum.git /opt/postex/LinEnum
git clone https://github.com/diego-treitos/linux-smart-enumeration.git /opt/postex/LSE

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
# 7. Alias útiles
# =========================================
echo -e "${YELLOW}[+] Configurando alias...${RESET}"
cat << 'EOF' >> ~/.bashrc

# Alias personalizados PNPT
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias pscan='nmap -Pn -sV -sC'
alias rustscan-fast='rustscan -b 500 -a'
alias searchsploit='searchsploit --colour'

EOF
source ~/.bashrc

# =========================================
# 8. Limpieza final
# =========================================
echo -e "${GREEN}[✓] Instalación completada. Tu Kali está listo para PNPT.${RESET}"
echo -e "${YELLOW}Herramientas instaladas en /opt y wordlists en /opt/wordlists${RESET}"
