#!/bin/bash

set -e # Eğer bir komutun çıkış durumu sıfırdan farklıysa, o komutun hemen ardından çıkılır.

clear # Terminal ekranı temizlenir.

BLACK='\e[30m' # Siyah renk kodu
RED='\e[31m' # Kırmızı renk kodu
GREEN='\e[92m' # Yeşil renk kodu
YELLOW='\e[33m' # Sarı renk kodu
ORANGE='\e[93m' # Turuncu renk kodu
BLUE='\e[34m' # Mavi renk kodu
PURPLE='\e[35m' # Mor renk kodu
CYAN='\e[36m' # Turkuaz renk kodu
WHITE='\e[37m' # Beyaz renk kodu
NC='\e[0m' # Renk kodlarının kullanımını sonlandıran kod
purpal='\033[35m' # Mor renk kodu

echo -e "${ORANGE} " # Ekrana turuncu renkte bir boşluk yazdırılır.
echo "" # Boş bir satır yazdırılır.
echo "   ▄█    █▄       ▄████████  ▄████████    ▄█   ▄█▄  ▄█  ███▄▄▄▄      ▄██████▄           ███      ▄██████▄   ▄██████▄   ▄█       ";
echo "  ███    ███     ███    ███ ███    ███   ███ ▄███▀ ███  ███▀▀▀██▄   ███    ███      ▀█████████▄ ███    ███ ███    ███ ███       ";
echo "  ███    ███     ███    ███ ███    █▀    ███▐██▀   ███▌ ███   ███   ███    █▀          ▀███▀▀██ ███    ███ ███    ███ ███       ";
echo " ▄███▄▄▄▄███▄▄   ███    ███ ███         ▄█████▀    ███▌ ███   ███  ▄███                 ███   ▀ ███    ███ ███    ███ ███       ";
echo "▀▀███▀▀▀▀███▀  ▀███████████ ███        ▀▀█████▄    ███▌ ███   ███ ▀▀███ ████▄           ███     ███    ███ ███    ███ ███       ";
echo "  ███    ███     ███    ███ ███    █▄    ███▐██▄   ███  ███   ███   ███    ███          ███     ███    ███ ███    ███ ███       ";
echo "  ███    ███     ███    ███ ███    ███   ███ ▀███▄ ███  ███   ███   ███    ███          ███     ███    ███ ███    ███ ███▌    ▄ ";
echo "  ███    █▀      ███    █▀  ████████▀    ███   ▀█▀ █▀    ▀█   █▀    ████████▀          ▄████▀    ▀██████▀   ▀██████▀  █████▄▄██ ";
echo "                                         ▀                                                                            ▀         ";

echo -e "${BLUE} https://github.com/Z4nzu/hackingtool ${NC}"
echo -e "${RED} [!] Bu Aracın Çalıştırılması için ROOT yetkisine Sahip Olmanız Gerekir [!]${NC}\n"
echo -e ${CYAN} "En İyi Seçeneği Seçin(Kullandığınız İşletim Sistemi): \n"
echo -e "${WHITE} [1] Kali Linux / Parrot-Os (apt)"
echo -e "${WHITE} [2] Arch Linux (pacman)" # feature request #231 için Arch Linux desteği eklendi
echo -e "${WHITE} [0] Çıkış "
echo -n -e "Yanıtınızı Giriniz >> "
read choice
INSTALL_DIR="/usr/share/doc/hackingtool"
BIN_DIR="/usr/bin/"
if [ $choice == 1 ] || [ $choice == 2 ]; then
echo "[*] İnternet Bağlantısı Kontrol Ediliyor .."
wget -q --tries=10 --timeout=20 --spider https://google.com
if [[ $? == 0 ]]; then
echo -e ${BLUE}"[✔] Yükleniyor ... "
if [ $choice == 1 ]; then
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install python3-pip -y
elif [ $choice == 2 ]; then # feature request #231 için Arch Linux desteği eklendi
            sudo pacman -Suy
            sudo pacman -S python-pip yay
        fi

echo "[✔] Klasörler kontrol ediliyor..."
if [ -d "$INSTALL_DIR" ]; then
echo "[!] hackingtool adında bir klasör bulundu. Bunu değiştirmek istiyor musun? [y/n]:" ;
read input
if [ "$input" = "y" ]; then
sudo rm -R "$INSTALL_DIR"
else
exit
fi
fi

        echo "[✔] Kurulum yapılıyor ...\n";
sudo git clone https://github.com/Z4nzu/hackingtool.git "$INSTALL_DIR";
echo "#!/bin/bash
python3 $INSTALL_DIR/hackingtool.py" '${1+"$@"}' > hackingtool;
sudo chmod +x hackingtool;
sudo cp hackingtool /usr/bin/ && rm hackingtool;

            echo "\n[✔] Gereksinimler kurulmaya çalışılıyor ..."
    if [ $choice == 1 ]; then
        sudo pip3 install lolcat boxes flask requests
        sudo apt-get install -y figlet
    elif [ $choice == 2 ]; then # added arch linux support because of feature request #231
        sudo pip3 install lolcat boxes flask requests
        yay -S boxes --noconfirm
        sudo pacman -S figlet
    fi

else
	  echo -e $RED "Lütfen İnternet Bağlantınızı Kontrol Edin ..!!"
fi


    if [ -d "$INSTALL_DIR" ]; then
echo "";
echo "[✔] Başarıyla Kurulu ! \n\n";
echo -e $ORANGE " [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
echo            " [+]                                                             [+]"
echo -e $ORANGE " [+] ✔✔✔ Artık Terminal'de (hackingtool) Yazın ✔✔✔            [+]"
echo            " [+]                                                             [+]"
echo -e $ORANGE " [+]+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++[+]"
else
echo "[✘] Kurulum Başarısız Oldu ! [✘]";
exit
fi
elif [ $choice == 0 ] && [ $choice != 1 ] && [ $choice != 2 ]; then # fixed the "./test.sh: line 107: [: asd: integer expression expected" when entering any invalid input containing letters
echo -e $RED "[✘] Teşekkürler !! [✘] "
exit
else
echo -e $RED "[!] Geçerli Bir Seçenek Seçin [!]"
fi
