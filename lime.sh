#!/usr/bin/env bash

python3 res/opening.py
echo ""
chmod +x res/random.sh
source res/random.sh
echo ""
echo "
     | Welcom to The Soure Automation tool!  |
     |---------------------------------------|
     |           By @Neev0Slid               |
     |_______________________________________|"
sleep 1
echo ""

#The option setup section#
optionSelect() {
    local options

    while [[ ! $options =~ ^[1-19]$ ]]; do
        echo -n " 1. TCP Connect Scan            "
        echo " 11. Start NetCat Private Chat"
        echo ''         
        echo -n " 2. OS Scan                     "
        echo " 12. Join NetCat Private Chat"
        echo ''
        echo -n " 3. UDP Scan                    "
        echo " 13. Lime Video_Downloader"
        echo ''
        echo -n " 4. Version Dectection Scan     "
        echo " 14. Assistant (GPT-4)"
        echo ''
        echo -n " 5. Stealth Scan                "
        echo " 15. Lime_Cracker (md5)"
        echo ''
        echo -n " 6. Fast Scan                   "
        echo " 16. Lime Encrypter (AES)"
        echo ''
        echo -n " 7. Ping Scan                   "
        echo " 17. Lime Decrypter (AES)"
        echo ''
        echo -n " 8. Script Scan                 "
        echo " 18. install Lime Encrypter requirements"
        echo ''
        echo -n " 9. Aggressive Scan             "
        echo " 19. Update Script"
        echo ''
        echo -n " 10. Firewall Evasion Techniques"
        echo " 00. Exit"
        echo ""
        read -p "#Choose an option:" options

        case $options in
            1)
                echo ''
                tcpScan
                echo ''
            ;;
            2)
                echo ''
                osScan
                echo ''
            ;;
            3)
                echo ''
                udpScan
                echo ''
            ;;
            4)
                echo ''
                verScan
                echo ''
            ;;
            5)
                echo ''
                stealthScan
                echo ''
            ;;
            6)
                echo ''
                fScan
                echo ''
            ;;
            7)
                echo ''
                pScan
                echo ''
            ;;
            8)
                echo ''
                SprScan
                echo ''
            ;;
            9)
                echo ''
                agrScan
                echo ''
            ;;
            10)
                echo ''
                fireScan
                echo ''
            ;;
            11)
                echo ''
                chatlogo
                startChat
                echo ''
            ;;
            12)
                echo ''
                chatlogo
                joinChat
                echo ''
            ;;
            13)
                echo ''
                download_video
                echo ''
            ;;
            14)
                echo ''
                runlogo
                echo "#Pls make sure you have a vilaid api-key from "https://platform.openai.com" & paste it in the file named "api-key.py"" 
                echo "#Hi am Aira, and Im here to help"
                echo ""
                runGpt
            ;;
            15)
                echo ''
                limeCracker
                echo ''
            ;;
            16)
                echo ''
                read -p "#Enter The file path here: " file_path_given
                encrypt_file "$file_path_given"
                echo ''
                echo ''
            ;;
            17)
                echo ''
                read -p "#Enter the file path here: " file_path_given
                decrypt_file "$file_path_given"
                echo ''
                echo ''
            ;;
            18)
                echo ''
                Lmd5
            ;;
            19)
                echo ''
                runUpdate
                exit 0
            ;;
            00)
                exitscript
            ;;
            99)
                echo ""
                echo ""
                echo "##### WELCOM TO THE CHALLANGE #####" 
                echo "######### GO TO THIS DIR FOR MORE INFOMATION!!! #########"
                echo  "######## etc/wordlist/OpenMe.txt ########"
                sleep 5
                echo "############# GOOD LUCK #############"
                sleep 5
                clear
                exit 0
            ;;    
            *)
                echo " #invalid option! please chose a number between 1 and 14."
                echo ""
                echo ""
            ;;
        esac
    done
}

#Scan Config
tcpScan() {
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sT "$target"
}

osScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -O "$target"
}

udpScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sU "$target"
}

verScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sV "$target"
}

stealthScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sS "$target"
}

fScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -F "$target"
}

pScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sn "$target"
}

SprScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -sC "$target"
}

agrScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -A "$target"
}

fireScan(){
    local target
    read -p "#Enter the target ip:" target

    sudo nmap -f -D RND:10 "$target"
}

#ncat config section#
chatlogo(){
    echo "        _________________________________________"
    echo "       | Welcom to The NetCat Private Messenger!|"
    echo "        -----------------------------------------"
    echo "       |              By @Neev0Slid             |"
    echo "        _________________________________________"
    echo ""
}
startChat(){
    local my_ip
    local my_port

    read -p "#Enter your ip Address (ifconfig): " my_ip
    read -p "#ip: $my_ip, enter the port: " my_port
    sleep 1
    echo ""
    echo "#Waiting for connection"
    
    sudo ncat -lv "$my_ip" "$my_port"

}

joinChat(){
    local host_ip
    local host_port

    read -p "#Enter the Host ip adderss: " host_ip
    read -p "#ip: $host_ip, enter the Host port: " host_port
    sleep 1
    echo ""
    echo " #Waiting for connection"

    sudo ncat "$host_ip" "$host_port"

}
#Lime-Downloader
download_video() {
    python3 Lime-Downloader/Ldownloader.py
}

runlogo(){
    echo "                 ____________________________________________
                 | Welcome to Aira, your ultimate assistant |
                 |  for seamless support and unrivaled      |
                 |               guidance!                  | 
                 |------------------------------------------|
                 |              By @Neev0Slid               |
                 ____________________________________________"
    echo ""
}
#Assistance Aire
runGpt() {
    local command
    while true; do
        read -p "#How may I help you?: " command
        python3 Gpt-4/gpt-4.py --prompt "$command"
    done
}

limeCracker(){
    chmod +x res/lcracker.sh
    source res/lcracker.sh
}

function encrypt_file() {
    # Check if file exists
    if [ ! -f "$1" ]; then
        echo "Error: File not found"
        exit 1
    fi
    
    # Encrypt the file using AES
    openssl enc -aes-256-cbc -salt -in "$1" -out "$1.enc"
    echo "#Enter your sudo password:"
    sudo rm "$1"
    echo "File encrypted successfully"
    echo ""
}

function decrypt_file() {
    # Check if file exists
    if [ ! -f "$1" ]; then
        echo "Error: File not found"
        exit 1
    fi
    
    # Decrypt the file using AES
    openssl enc -aes-256-cbc -d -in "$1" -out "${1%.enc}"
    echo "#Enter your sudo password:"
    sudo rm "$1"
    echo "File decrypted successfully"
    echo ""
}

Lmd5(){
    chmod +x res/md5-install.sh
    chmod +x res/md5sum.sh
    echo "#!!YOU ARE INSTALLING MD5 & MD5SUM!!"
    source res/md5-install.sh
    echo ""
    sleep 1
    echo "#!!Md5sum!!"
    source res/md5sum.sh
    echo ""
    exit 0
}

runUpdate(){
    chmod +x update.sh
    source update.sh
}

exitscript(){
    exit 0
}
optionSelect
