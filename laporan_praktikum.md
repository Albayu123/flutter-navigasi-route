# Laporan Praktikum Flutter — Route dan Navigasi

**Nama:** Muhammad Alief Albayu
**Topik:** Route dan Navigasi — Navigator, push, pop, Named Routes, Arguments
**Tanggal:** 23 Juni 2026

---

## 1. Screenshot Aplikasi

> [!NOTE]
> Tempelkan screenshot HomePage di emulator.

> [!NOTE]
> Tempelkan screenshot CoursePage di emulator.

> [!NOTE]
> Tempelkan screenshot DetailPage di emulator.

> [!NOTE]
> Tempelkan screenshot KatalogHomePage di emulator.

---

## 2. Jawaban Observasi (Section K)

| Bagian | Pertanyaan | Jawaban |
|---|---|---|
| **Route** | Apa perbedaan HomePage, CoursePage, DetailPage, dan ProfilePage sebagai route? | `HomePage` bertindak sebagai rute utama (`initialRoute: '/'`) dan entry point antarmuka aplikasi. `CoursePage` (`/courses`) adalah rute menu untuk menampilkan daftar kursus. `DetailPage` (`/detail`) adalah rute dinamis untuk menampilkan informasi detail berdasarkan argumen yang dikirim. `ProfilePage` (`/profile`) adalah rute informasi statis mengenai pengguna. |
| **Navigator.push()** | Apa yang terjadi ketika tombol Buka About ditekan? | Navigator akan menumpuk (push) halaman `AboutPage` ke atas stack navigasi yang aktif menggunakan `MaterialPageRoute`. Transisi ini terjadi secara imperatif tanpa menggunakan konfigurasi rute bernama. |
| **Navigator.pop()** | Apa yang terjadi ketika tombol Kembali ditekan? | Navigator akan menghapus (pop) halaman aktif teratas dari stack navigasi dan menghancurkannya (dispose), sehingga menampilkan kembali halaman yang berada tepat di bawahnya dalam stack tersebut. |
| **Named routes** | Apa fungsi initialRoute dan routes pada MaterialApp? | `initialRoute` berfungsi menetapkan nama rute string yang akan dibuka pertama kali saat aplikasi dimulai. `routes` adalah peta (`Map<String, WidgetBuilder>`) yang mendaftarkan seluruh relasi antara string nama rute dengan fungsi pembangun (builder) halaman tujuan agar navigasi terpusat. |
| **Arguments** | Bagaimana nama course dikirim dari CoursePage ke DetailPage? | Data dikirim dalam parameter `arguments` berupa objek `Map<String, String>` saat memanggil `Navigator.pushNamed(context, '/detail', arguments: course)`. Halaman penerima mengakses data ini melalui `ModalRoute.of(context)!.settings.arguments as Map<String, String>`. |
| **Return result** | Apa isi SnackBar setelah kembali dari DetailPage? | SnackBar menampilkan data bertipe `Object?` hasil kembalian dari fungsi `Navigator.pop`. Isinya bervariasi sesuai tombol yang ditekan: `'Course "[Nama Course]" berhasil disimpan!'` (tombol Simpan Course) atau `'Anda kembali dari course: [Nama Course]'` (tombol Pilih Course). |
| **Route stack** | Halaman mana yang berada di atas stack setelah DetailPage dibuka? | Halaman `DetailPage` berada di posisi paling atas stack (top of the stack), di bawahnya terdapat `CoursePage`, dan di dasar stack terdapat `HomePage`. |

---

## 3. Perbandingan Named Route vs MaterialPageRoute

| Aspek | Named Route | MaterialPageRoute |
|---|---|---|
| **Cara membuka** | `Navigator.pushNamed(context, '/namaRoute', arguments: data)` | `Navigator.push(context, MaterialPageRoute(builder: (context) => const TargetPage()))` |
| **Cara mendaftarkan** | Harus didaftarkan secara terpusat dalam properti `routes` di `MaterialApp`. | Tidak perlu didaftarkan di MaterialApp, dibuat secara instan saat dibutuhkan. |
| **Cocok digunakan saat** | Aplikasi memiliki banyak rute statis yang terstruktur, rute sering diakses berulang kali, atau saat menerapkan deep-linking. | Rute hanya sesekali diakses (seperti About, Help, Settings sederhana), atau ketika halaman tujuan bersifat dinamis dan ad-hoc. |

---

## 4. Alur Navigasi yang Diamati

Tulis urutan halaman yang dikunjungi saat mencoba aplikasi, contoh:
```
Home → CoursePage → DetailPage (kembali dengan hasil) → CoursePage (SnackBar muncul)
```

Alur yang kamu lakukan:
```
1. Home → CoursePage → DetailPage (Simpan Course) → CoursePage (Tampil SnackBar "berhasil disimpan") → Home
2. Home → Profile → Home
3. Home → AboutPage → Home
4. Home → SettingsPage → Home
5. Home → KatalogHomePage (FAB) → KatalogProfilPage → KatalogHomePage → KatalogDetailPage (Pinjam Buku) → KatalogHomePage (Tampil SnackBar "berhasil dipinjam") → KatalogTentangPage → KatalogHomePage → Home
```

---

## 5. Kesimpulan

Dengan menggunakan Navigator di Flutter, perpindahan halaman dilakukan melalui struktur data stack (LIFO - Last In First Out) menggunakan operasi `push()` untuk masuk dan `pop()` untuk kembali. `Named routes` memfasilitasi arsitektur navigasi yang rapi dan terpusat di `MaterialApp`, sementara `MaterialPageRoute` menawarkan fleksibilitas navigasi instan tanpa registrasi rute terlebih dahulu. Flutter juga mempermudah komunikasi antarhalaman baik secara searah (menggunakan `arguments`) maupun secara timbal balik (menangkap hasil kembalian dari `Navigator.pop()`).
