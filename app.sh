#!/bin/bash

#Color Code - Foreground
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"

#Color Code - Background
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_LIGHT_GRAY="\e[47m"
BG_GRAY="\e[100m"
BG_LIGHT_RED="\e[101m"
BG_LIGHT_GREEN="\e[102m"
BG_LIGHT_YELLOW="\e[103m"
BG_LIGHT_BLUE="\e[104m"
BG_LIGHT_MAGENTA="\e[105m"
BG_LIGHT_CYAN="\e[106m"
BG_WHITE="\e[107m"

#Reset Color
ENDCOLOR="\e[0m"

#Deklarasi Array
namaArray=()
nilaiAkhirArray=()
indeksArray=()

#Deklarasi Variabel yang akan digunakan
namaMahasiswa=""
nilaiAbsen=0
nilaiTugas=0
nilaiUts=0
nilaiUas=0
nilaiAkhir=0
indeks="E"

#Fungsi untuk menentukan indeks berdasarkan nilai akhir (Notes for me : ternyata bash ga support float)
hitungNilaiAkhir() {
    nilaiAkhir=$((nilaiAbsen*10/100 + nilaiTugas*20/100 + nilaiUts*30/100 + nilaiUas*40/100 ))
    if [ "$nilaiAkhir" -ge 80 ]; then
        indeks="A"
    elif [ "$nilaiAkhir" -ge 70 ]; then
        indeks="B"
    elif [ "$nilaiAkhir" -ge 60 ]; then
        indeks="C"
    elif [ "$nilaiAkhir" -ge 50 ]; then
        indeks="D"
    else
        indeks="E"
    fi
}

#Fungsi untuk menambahkan data ke array
addtoArray(){
    namaArray+=("$namaMahasiswa")
    nilaiAkhirArray+=("$nilaiAkhir")
    indeksArray+=("$indeks")
}

#Fungsi untuk input data mahasiswa
inputData(){
    echo -e "${BG_CYAN}${WHITE} Input Data Mahasiswa ${ENDCOLOR}"
    #Input Data Mahasiswa
    read -p "Masukkan Nama Mahasiswa: " namaMahasiswa
    #Validasi input namaMahasiswa tidak boleh kosong
    if [ -z "$namaMahasiswa" ]; then
        echo -e "${RED}Nama Mahasiswa tidak boleh kosong. Silakan coba lagi.${ENDCOLOR}"
        inputData
        return
    fi

    #Input Nilai Mahasiswa
    read -p "Masukkan Nilai Absen (0-100): " nilaiAbsen
    #Validasi input nilaiAbsen harus antara 0-100
    if [ $nilaiAbsen -lt 0 ] || [ $nilaiAbsen -gt 100 ] || [ -z "$nilaiAbsen" ]; then
        echo -e "${RED}Nilai Absen harus antara 0 hingga 100. Silakan coba lagi.${ENDCOLOR}"
        inputData
        return
    fi
    
    #Input Nilai Tugas
    read -p "Masukkan Nilai Tugas (0-100): " nilaiTugas
    #Validasi input nilaiTugas harus antara 0-100
    if [ $nilaiTugas -lt 0 ] || [ $nilaiTugas -gt 100 ] || [ -z "$nilaiTugas" ]; then
        echo -e "${RED}Nilai Tugas harus antara 0 hingga 100. Silakan coba lagi.${ENDCOLOR}"
        inputData
        return
    fi

    #Input Nilai UTS
    read -p "Masukkan Nilai UTS (0-100): " nilaiUts
    #Validasi input nilaiUts harus antara 0-100
    if [ $nilaiUts -lt 0 ] || [ $nilaiUts -gt 100 ] || [ -z "$nilaiUts" ]; then
        echo -e "${RED}Nilai UTS harus antara 0 hingga 100. Silakan coba lagi.${ENDCOLOR}"
        inputData
        return
    fi

    #Input Nilai UAS
    read -p "Masukkan Nilai UAS (0-100): " nilaiUas
    #Validasi input nilaiUas harus antara 0-100
    if [ $nilaiUas -lt 0 ] || [ $nilaiUas -gt 100 ] || [ -z "$nilaiUas" ]; then
        echo -e "${RED}Nilai UAS harus antara 0 hingga 100. Silakan coba lagi.${ENDCOLOR}"
        inputData
        return
    fi
}

#Fungsi untuk menampilkan data mahasiswa
showData() {
    echo -e "${BG_BLUE}${WHITE} Data Mahasiswa ${ENDCOLOR}"
    echo ""

    #Menampilkan data dari array + validasi jika array kosong
    if [ ${#namaArray[@]} -ne 0 ]; then
        for i in "${!namaArray[@]}"; do
        echo -e "${YELLOW}Nama Mahasiswa:${ENDCOLOR} ${namaArray[$i]}"
        echo -e "${YELLOW}Nilai Akhir:${ENDCOLOR} ${nilaiAkhirArray[$i]}"
        echo -e "${YELLOW}Indeks:${ENDCOLOR} ${indeksArray[$i]}"
        echo -e "${CYAN}------------------------------${ENDCOLOR}"
    done
    else
        echo -e "${YELLOW}Belum ada data mahasiswa yang diinputkan.${ENDCOLOR}"
    fi
}

#Fungsi untuk memulai proses input data
inputProcess(){
    inputData
    echo ""
    echo ""
    echo -e "${BG_GREEN}${WHITE} Data berhasil diinputkan! ${ENDCOLOR}"
    hitungNilaiAkhir
    addtoArray
    echo ""
    echo ""
    showData
}

#Fungsi  utama
main() {
    #Sengaja dibikin true biar selalu loop
    while true; do
        echo ""
        echo ""
        echo -e "${BG_MAGENTA}${WHITE} MENU UTAMA ${ENDCOLOR}"
        echo "1. Input Data Mahasiswa"
        echo "2. Tampilkan Data Mahasiswa"
        echo "3. Keluar"
        read -p "Masukkan pilihan Anda (1-3): " pilihan

        #Menangani pilihan Menu
        case $pilihan in
            1)  
                echo ""
                echo ""
                inputProcess
                ;;
            2)  
                echo ""
                echo ""
                showData
                ;;
            3)
                echo ""
                echo ""
                echo -e "${RED}Keluar dari program.${ENDCOLOR}"
                echo ""
                echo ""
                exit 0
                ;;
            *)
                #validasi pilihan tidak valid
                echo -e "${RED}Pilihan tidak valid. Silakan coba lagi.${ENDCOLOR}"
                ;;
        esac
    done
}

main
