# Aplikasi CLI Manajemen Nilai Mahasiswa

Aplikasi command-line interface berbasis Bash untuk mengelola data nilai mahasiswa. Aplikasi ini menghitung nilai akhir berdasarkan bobot komponen penilaian dan menentukan indeks huruf secara otomatis.

## Video

Link youtube video : https://youtu.be/_lj4XRLRkQE

## Deskripsi Project

Aplikasi ini dirancang untuk membantu pengelolaan data nilai mahasiswa dengan fitur:

- Input data mahasiswa dan nilai komponen (Absen, Tugas, UTS, UAS)
- Perhitungan nilai akhir otomatis berdasarkan bobot: Absen (10%), Tugas (20%), UTS (30%), UAS (40%)
- Konversi nilai akhir ke indeks huruf (A, B, C, D, E)
- Penyimpanan data dalam array untuk multiple entries
- Validasi input untuk memastikan data valid
- Interface dengan warna untuk meningkatkan user experience

## Struktur Project

```
project-app-cli-scripting-os-azwin/
├── app.sh          # File utama aplikasi
├── LICENSE         # Lisensi project
└── README.md       # Dokumentasi project
```

### Komponen Utama dalam `app.sh`

1. **Color Variables**: Deklarasi warna untuk tampilan terminal
2. **Data Arrays**:
   - `namaArray[]` - Menyimpan nama mahasiswa
   - `nilaiAkhirArray[]` - Menyimpan nilai akhir
   - `indeksArray[]` - Menyimpan indeks huruf
3. **Fungsi Utama**:
   - `hitungNilaiAkhir()` - Menghitung nilai akhir dan menentukan indeks
   - `addtoArray()` - Menambahkan data ke array
   - `inputData()` - Menangani input data dengan validasi
   - `showData()` - Menampilkan semua data mahasiswa
   - `inputProcess()` - Mengatur alur input data
   - `main()` - Menu utama aplikasi

## Konversi Indeks

| Nilai Akhir | Indeks |
| ----------- | ------ |
| 80 - 100    | A      |
| 70 - 79     | B      |
| 60 - 69     | C      |
| 50 - 59     | D      |
| 0 - 49      | E      |

## Screenshots

### Menu Utama dan Input Data

<img src="Screenshot 2025-11-16 143931.png" alt="Menu Utama dan Input Data Mahasiswa" width="600">

### Tampilan Data Mahasiswa

<img src="Screenshot 2025-11-16 144027.png" alt="Tampilan Data Mahasiswa" width="600">

## Cara Penggunaan

### Prasyarat

- Sistem operasi Linux/Unix atau Windows dengan Git Bash/WSL
- Bash shell (version 4.0 atau lebih baru)

### Instalasi

1. Clone repository:

```bash
git clone https://github.com/azwinrx/project-app-cli-scripting-os-azwin.git
cd project-app-cli-scripting-os-azwin
```

2. Berikan permission execute pada script:

```bash
chmod +x app.sh
```

### Menjalankan Aplikasi

```bash
./app.sh
```

### Panduan Penggunaan

1. **Input Data Mahasiswa (Menu 1)**

   - Pilih opsi 1 dari menu utama
   - Masukkan nama mahasiswa
   - Masukkan nilai Absen (0-100)
   - Masukkan nilai Tugas (0-100)
   - Masukkan nilai UTS (0-100)
   - Masukkan nilai UAS (0-100)
   - Sistem akan otomatis menghitung dan menampilkan nilai akhir beserta indeks

2. **Tampilkan Data Mahasiswa (Menu 2)**

   - Pilih opsi 2 dari menu utama
   - Aplikasi akan menampilkan semua data mahasiswa yang telah diinput

3. **Keluar (Menu 3)**
   - Pilih opsi 3 untuk keluar dari aplikasi

### Validasi Input

Aplikasi melakukan validasi pada:

- Nama mahasiswa tidak boleh kosong
- Semua nilai harus dalam rentang 0-100
- Input nilai harus berupa angka

Jika terjadi kesalahan input, aplikasi akan meminta user untuk menginput ulang.

## Formula Perhitungan

```
Nilai Akhir = (Absen × 10%) + (Tugas × 20%) + (UTS × 30%) + (UAS × 40%)
```

## Lisensi

Project ini dilisensikan di bawah MIT License - lihat file [LICENSE](LICENSE) untuk detail.

## Author

**Azwin** - [azwinrx](https://github.com/azwinrx)

Project Assignment: Lumoshive Bootcamp Backend Golang
