# AGENT.md — Praktikum Flutter Route dan Navigasi

## Identitas
- **Nama Mahasiswa:** Muhammad Alief Albayu
- **Topik:** Route dan Navigasi — Navigator.push(), pop(), MaterialPageRoute, Named Routes, Arguments
- **Sumber Materi:** Section J, K, L, M, N — Materi Praktikum Flutter 2026

---

## Tujuan Agent
Kamu adalah coding agent yang bertugas membuat proyek Flutter dari nol, lalu mengerjakan seluruh tugas praktikum (Tugas 1 hingga Tugas 5) secara lengkap dan terstruktur. Semua kode ditulis dalam satu file `lib/main.dart`. Kamu juga wajib membuat file `laporan_praktikum.md` sebagai template laporan observasi. Kedua file harus selesai tanpa error sebelum dianggap selesai.

---

## Langkah 0 — Buat Proyek Baru

```bash
flutter create praktikum_route_navigasi
cd praktikum_route_navigasi
```

Hapus seluruh isi `lib/main.dart` dan ganti dengan kode sesuai instruksi di bawah.

---

## Langkah 1 — Buat Praktikum Utama (Section J)

Buat `lib/main.dart` dengan struktur class berikut. Salin dan sesuaikan dari kode praktikum utama.

### Class `PraktikumApp extends StatelessWidget`
- `MaterialApp` dengan `debugShowCheckedModeBanner: false`
- `title: 'Praktikum Route dan Navigasi'`
- `theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true)`
- `initialRoute: '/'`
- `routes` mendaftarkan empat route:
  ```dart
  routes: {
    '/': (context) => const HomePage(),
    '/courses': (context) => const CoursePage(),
    '/detail': (context) => const DetailPage(),
    '/profile': (context) => const ProfilePage(),
  }
  ```

### Class `HomePage extends StatelessWidget`
`build()` mengembalikan `Scaffold` dengan `AppBar(title: 'Home', centerTitle: true)` dan body `Padding(all: 24)` berisi `Column(crossAxisAlignment: stretch)`:
- `Icon(Icons.route, size: 80, color: Colors.blue)`
- `SizedBox(height: 16)`
- `Text('Praktikum Route dan Navigasi', center, fontSize: 24, bold)`
- `SizedBox(height: 8)`
- `Text(deskripsi singkat, center)`
- `SizedBox(height: 32)`
- `ElevatedButton.icon` → `Navigator.pushNamed(context, '/courses')`, icon: `Icons.list`, label: `'Buka Daftar Course'`
- `SizedBox(height: 12)`
- `OutlinedButton.icon` → `Navigator.pushNamed(context, '/profile')`, icon: `Icons.person`, label: `'Buka Profile'`
- `SizedBox(height: 12)`
- `TextButton.icon` → `Navigator.push` dengan `MaterialPageRoute(builder: (context) => const AboutPage())`, icon: `Icons.info`, label: `'Buka About dengan MaterialPageRoute'`

### Class `CoursePage extends StatelessWidget`
- Field `final List<String> courses = const ['Flutter Dasar', 'Route dan Navigasi', 'Form dan Input', 'Layout Widget']`
- Method `Future<void> _bukaDetail(BuildContext context, String course) async`:
  ```dart
  final Object? hasil = await Navigator.pushNamed(context, '/detail', arguments: course);
  if (context.mounted && hasil != null) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(hasil.toString())));
  }
  ```
- `build()` mengembalikan `Scaffold(appBar: 'Daftar Course')` dengan body `ListView.separated`:
  - `padding: EdgeInsets.all(16)`, `separatorBuilder: SizedBox(height: 12)`
  - Setiap item: `Card` berisi `ListTile(leading: Icon(Icons.school), title: Text(course), subtitle: 'Tekan untuk melihat detail', trailing: Icon(Icons.arrow_forward_ios), onTap: () => _bukaDetail(context, course))`

### Class `DetailPage extends StatelessWidget`
- Di awal `build()`: `final String course = ModalRoute.of(context)!.settings.arguments as String;`
- `Scaffold(appBar: 'Detail Course')` dengan body `Padding(all: 24)` berisi `Column(stretch)`:
  - `Icon(Icons.menu_book, size: 80, color: Colors.blue)`
  - `SizedBox(height: 16)`
  - `Text(course, center, fontSize: 24, bold)`
  - `SizedBox(height: 12)`
  - `Text('Halaman ini menerima data nama course dari halaman sebelumnya menggunakan arguments.', center)`
  - `SizedBox(height: 32)`
  - `ElevatedButton.icon` → `Navigator.pop(context, 'Anda kembali dari course: $course')`, icon: `Icons.check`, label: `'Pilih Course dan Kembali'`

### Class `ProfilePage extends StatelessWidget`
- `Scaffold(appBar: 'Profile')` dengan body `Center` → `Padding(all: 24)` → `Column(mainAxisSize: min)`:
  - `Icon(Icons.account_circle, size: 96, color: Colors.blue)`
  - `SizedBox(height: 16)`
  - `Text('Peserta Praktikum Flutter', fontSize: 22, bold)`
  - `SizedBox(height: 8)`
  - `Text('Halaman ini dibuka menggunakan named route /profile.', center)`
  - `SizedBox(height: 24)`
  - `OutlinedButton('Kembali')` → `Navigator.pop(context)`

### Class `AboutPage extends StatelessWidget`
- `Scaffold(appBar: 'About')` dengan body `Center` → `Padding(all: 24)` → `Column(mainAxisSize: min)`:
  - `Icon(Icons.info_outline, size: 80, color: Colors.blue)`
  - `SizedBox(height: 16)`
  - `Text('Dibuka dengan MaterialPageRoute', center, fontSize: 22, bold)`
  - `SizedBox(height: 8)`
  - `Text('Halaman ini tidak memakai named route, tetapi dibuat langsung saat tombol ditekan.', center)`
  - `SizedBox(height: 24)`
  - `ElevatedButton('Kembali')` → `Navigator.pop(context)`

---

## Langkah 2 — Tugas 1: Menambah Route Baru (`SettingsPage`)

Buat class baru `SettingsPage extends StatelessWidget`:
- `Scaffold(appBar: 'Pengaturan', centerTitle: true)`
- Body `Center` → `Padding(all: 24)` → `Column(mainAxisSize: min)`:
  - `Icon(Icons.settings, size: 80, color: Colors.blue)`
  - `SizedBox(height: 16)`
  - `Text('Halaman Pengaturan', fontSize: 22, bold, center)`
  - `SizedBox(height: 8)`
  - `Text('Halaman ini didaftarkan menggunakan named route /settings.', center)`
  - `SizedBox(height: 24)`
  - `OutlinedButton('Kembali')` → `Navigator.pop(context)`

Daftarkan ke `routes` di `PraktikumApp`:
```dart
'/settings': (context) => const SettingsPage(),
```

Tambahkan tombol di `HomePage` setelah tombol `TextButton About`:
```dart
const SizedBox(height: 12),
// Tugas 1: Route baru /settings
OutlinedButton.icon(
  onPressed: () => Navigator.pushNamed(context, '/settings'),
  icon: const Icon(Icons.settings),
  label: const Text('Buka Pengaturan'),
),
```

---

## Langkah 3 — Tugas 2: Modifikasi Daftar Course

Ganti field `courses` di `CoursePage` menjadi `List<Map<String, String>>` agar bisa menyimpan judul dan subtitle berbeda per item:

```dart
// Tugas 2: Daftar course diperluas dengan subtitle unik per item
final List<Map<String, String>> courses = const [
  {'judul': 'Flutter Dasar', 'subtitle': 'Widget, Text, Icon, Button'},
  {'judul': 'Route dan Navigasi', 'subtitle': 'Push, Pop, Named Routes'},
  {'judul': 'Form dan Input', 'subtitle': 'TextField, Validasi, Form'},
  {'judul': 'Layout Widget', 'subtitle': 'Container, Card, Expanded'},
  {'judul': 'State Management', 'subtitle': 'setState, Provider dasar'},
  {'judul': 'HTTP dan API', 'subtitle': 'Fetch data dari internet'},
  {'judul': 'Firebase Dasar', 'subtitle': 'Auth dan Firestore'},
];
```

Sesuaikan `ListView.separated` untuk membaca `courses[index]['judul']` dan `courses[index]['subtitle']`. Ubah icon setiap item secara bergantian berdasarkan index:
```dart
leading: Icon(
  index % 2 == 0 ? Icons.school : Icons.menu_book,
  color: Colors.blue,
),
```

Sesuaikan `_bukaDetail` agar tetap mengirim `String` judul sebagai arguments:
```dart
_bukaDetail(context, courses[index]['judul']!);
```

---

## Langkah 4 — Tugas 3: Kirim Data Lebih Lengkap (Map)

Ganti tipe arguments dari `String` menjadi `Map<String, String>` yang berisi judul, kategori, dan durasi.

Modifikasi `_bukaDetail` di `CoursePage`:
```dart
// Tugas 3: Kirim data lengkap dalam bentuk Map
Future<void> _bukaDetail(BuildContext context, Map<String, String> course) async {
  final Object? hasil = await Navigator.pushNamed(
    context,
    '/detail',
    arguments: course,
  );
  if (context.mounted && hasil != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(hasil.toString())),
    );
  }
}
```

Sesuaikan field `courses` agar setiap item juga memiliki key `kategori` dan `durasi`:
```dart
final List<Map<String, String>> courses = const [
  {'judul': 'Flutter Dasar', 'subtitle': 'Widget, Text, Icon, Button', 'kategori': 'Mobile', 'durasi': '2 jam'},
  {'judul': 'Route dan Navigasi', 'subtitle': 'Push, Pop, Named Routes', 'kategori': 'Mobile', 'durasi': '1.5 jam'},
  {'judul': 'Form dan Input', 'subtitle': 'TextField, Validasi, Form', 'kategori': 'Mobile', 'durasi': '2 jam'},
  {'judul': 'Layout Widget', 'subtitle': 'Container, Card, Expanded', 'kategori': 'Mobile', 'durasi': '1.5 jam'},
  {'judul': 'State Management', 'subtitle': 'setState, Provider dasar', 'kategori': 'Arsitektur', 'durasi': '3 jam'},
  {'judul': 'HTTP dan API', 'subtitle': 'Fetch data dari internet', 'kategori': 'Backend', 'durasi': '2.5 jam'},
  {'judul': 'Firebase Dasar', 'subtitle': 'Auth dan Firestore', 'kategori': 'Backend', 'durasi': '3 jam'},
];
```

Modifikasi `DetailPage` agar menerima `Map<String, String>` dan menampilkan semua field:
```dart
@override
Widget build(BuildContext context) {
  // Tugas 3: Ambil data Map dari arguments
  final Map<String, String> course =
      ModalRoute.of(context)!.settings.arguments as Map<String, String>;

  return Scaffold(
    appBar: AppBar(title: const Text('Detail Course'), centerTitle: true),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.menu_book, size: 80, color: Colors.blue),
          const SizedBox(height: 16),
          Text(
            course['judul'] ?? '-',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          // Info kategori
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.category, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text('Kategori: ${course['kategori'] ?? '-'}'),
            ],
          ),
          const SizedBox(height: 6),
          // Info durasi
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.timer, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text('Durasi: ${course['durasi'] ?? '-'}'),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Halaman ini menerima data lengkap course dari halaman sebelumnya menggunakan arguments berupa Map.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Tugas 4: Tombol Simpan Course
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context, 'Course "${course['judul']}" berhasil disimpan!');
            },
            icon: const Icon(Icons.save),
            label: const Text('Simpan Course'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pop(context, 'Anda kembali dari course: ${course['judul']}');
            },
            icon: const Icon(Icons.check),
            label: const Text('Pilih Course dan Kembali'),
          ),
        ],
      ),
    ),
  );
}
```

---

## Langkah 5 — Tugas 4: Hasil Balik dari DetailPage

Tugas 4 sudah tercakup di Langkah 4 di atas — tombol `'Simpan Course'` mengirim hasil balik berbeda dari tombol `'Pilih Course dan Kembali'`. Pastikan:

- Tombol **Simpan Course**: `Navigator.pop(context, 'Course "${course['judul']}" berhasil disimpan!')`
- Tombol **Pilih Course dan Kembali**: `Navigator.pop(context, 'Anda kembali dari course: ${course['judul']}')`
- `CoursePage._bukaDetail()` sudah menangkap `hasil` dan menampilkan `SnackBar`
- Tambahkan pengecekan `context.mounted` sebelum menampilkan `SnackBar`

---

## Langkah 6 — Tugas 5: Tantangan Mandiri (Aplikasi Katalog Buku)

Buat set halaman baru dengan tema **katalog buku**. Semua class baru ini ditambahkan di `lib/main.dart` dan bisa diakses dari `HomePage` melalui satu tombol `Navigator.push` menggunakan `MaterialPageRoute`.

Tambahkan tombol di `HomePage` paling bawah:
```dart
const SizedBox(height: 12),
// Tugas 5: Tantangan Mandiri
ElevatedButton.icon(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KatalogHomePage()),
    );
  },
  icon: const Icon(Icons.book),
  label: const Text('Buka Katalog Buku'),
),
```

### Spesifikasi halaman Tantangan Mandiri

**Wajib menggunakan:**
- Minimal 4 halaman (class)
- Minimal 2 named routes
- Minimal 1 `MaterialPageRoute`
- Minimal 1 pengiriman `arguments`
- Minimal 1 hasil balik dengan `Navigator.pop(context, result)`

**Daftarkan named routes baru di `PraktikumApp`:**
```dart
'/katalog': (context) => const KatalogHomePage(),
'/katalog/detail': (context) => const KatalogDetailPage(),
```

**Class yang harus dibuat:**

`KatalogHomePage extends StatelessWidget`
- `AppBar`: judul `'Katalog Buku'`
- Body: `ListView` berisi 5 item buku, setiap item berupa `Card` + `ListTile`
- Data buku: `List<Map<String, String>>` berisi `judul`, `penulis`, `genre`, `halaman`
- `onTap` setiap item: `Navigator.pushNamed(context, '/katalog/detail', arguments: buku)`
- Tambahkan `FloatingActionButton` dengan icon `Icons.person` yang membuka `KatalogProfilPage` via `Navigator.push` + `MaterialPageRoute`

`KatalogDetailPage extends StatelessWidget`
- Ambil arguments: `final Map<String, String> buku = ModalRoute.of(context)!.settings.arguments as Map<String, String>;`
- Tampilkan: judul, penulis, genre, jumlah halaman
- Tombol `'Pinjam Buku'` → `Navigator.pop(context, 'Buku "${buku['judul']}" berhasil dipinjam!')`
- Tombol `'Kembali'` → `Navigator.pop(context)`

`KatalogProfilPage extends StatelessWidget`
- Dibuka via `MaterialPageRoute` (bukan named route) — ini memenuhi syarat minimal 1 `MaterialPageRoute`
- Tampilkan profil pembaca: nama `'Muhammad Alief Albayu'`, status `'Mahasiswa Teknik Informatika'`
- Tombol `'Kembali'` → `Navigator.pop(context)`

`KatalogTentangPage extends StatelessWidget`
- Dibuka dari `KatalogHomePage` via named route `/katalog/tentang` atau `Navigator.pushNamed`
- Tampilkan informasi singkat tentang aplikasi katalog
- Tombol `'Kembali'` → `Navigator.pop(context)`

Daftarkan juga:
```dart
'/katalog/tentang': (context) => const KatalogTentangPage(),
```

---

## Struktur File Akhir

```
praktikum_route_navigasi/
└── lib/
    └── main.dart   ← SATU FILE berisi semua class:
        ├── main()
        ├── PraktikumApp              (entry point + semua routes)
        ├── HomePage                  (Praktikum Utama + semua tombol tugas)
        ├── CoursePage                (Tugas 2, 3, 4)
        ├── DetailPage                (Tugas 3, 4)
        ├── ProfilePage               (Praktikum Utama)
        ├── AboutPage                 (Praktikum Utama)
        ├── SettingsPage              (Tugas 1)
        ├── KatalogHomePage           (Tugas 5)
        ├── KatalogDetailPage         (Tugas 5)
        ├── KatalogProfilPage         (Tugas 5)
        └── KatalogTentangPage        (Tugas 5)

laporan_praktikum.md  ← template laporan observasi section K
```

### Daftar lengkap named routes di `PraktikumApp`:
```dart
routes: {
  '/': (context) => const HomePage(),
  '/courses': (context) => const CoursePage(),
  '/detail': (context) => const DetailPage(),
  '/profile': (context) => const ProfilePage(),
  '/settings': (context) => const SettingsPage(),         // Tugas 1
  '/katalog': (context) => const KatalogHomePage(),       // Tugas 5
  '/katalog/detail': (context) => const KatalogDetailPage(), // Tugas 5
  '/katalog/tentang': (context) => const KatalogTentangPage(), // Tugas 5
}
```

`AboutPage`, `KatalogProfilPage` tidak didaftarkan ke `routes` karena dibuka via `MaterialPageRoute`.

---

## Langkah 7 — Buat File `laporan_praktikum.md`

Buat file `laporan_praktikum.md` di root folder proyek:

```markdown
# Laporan Praktikum Flutter — Route dan Navigasi

**Nama:** Muhammad Alief Albayu
**Topik:** Route dan Navigasi — Navigator, push, pop, Named Routes, Arguments
**Tanggal:** _______________

---

## 1. Screenshot Aplikasi

> Tempelkan screenshot HomePage di emulator.

> Tempelkan screenshot CoursePage di emulator.

> Tempelkan screenshot DetailPage di emulator.

> Tempelkan screenshot KatalogHomePage di emulator.

---

## 2. Jawaban Observasi (Section K)

| Bagian | Pertanyaan | Jawaban |
|---|---|---|
| Route | Apa perbedaan HomePage, CoursePage, DetailPage, dan ProfilePage sebagai route? | |
| Navigator.push() | Apa yang terjadi ketika tombol Buka About ditekan? | |
| Navigator.pop() | Apa yang terjadi ketika tombol Kembali ditekan? | |
| Named routes | Apa fungsi initialRoute dan routes pada MaterialApp? | |
| Arguments | Bagaimana nama course dikirim dari CoursePage ke DetailPage? | |
| Return result | Apa isi SnackBar setelah kembali dari DetailPage? | |
| Route stack | Halaman mana yang berada di atas stack setelah DetailPage dibuka? | |

---

## 3. Perbandingan Named Route vs MaterialPageRoute

| Aspek | Named Route | MaterialPageRoute |
|---|---|---|
| Cara membuka | | |
| Cara mendaftarkan | | |
| Cocok digunakan saat | | |

---

## 4. Alur Navigasi yang Diamati

Tulis urutan halaman yang dikunjungi saat mencoba aplikasi, contoh:
```
Home → CoursePage → DetailPage (kembali dengan hasil) → CoursePage (SnackBar muncul)
```

Alur yang kamu lakukan:
```
(isi di sini)
```

---

## 5. Kesimpulan

> Tuliskan kesimpulan singkat tentang perbedaan push/pop, named routes, dan pengiriman data antar halaman.
```

---

## Aturan Penulisan Kode

- Gunakan `const` di mana memungkinkan
- Setiap class harus memiliki constructor `const ClassName({super.key})`
- Indentasi 2 spasi (standar Dart/Flutter)
- Nama class **PascalCase**, variabel **camelCase**
- Tambahkan komentar `// Tugas X` di atas setiap bagian yang ditambahkan per tugas
- Gunakan `debugPrint` bukan `print`
- Selalu cek `context.mounted` sebelum memanggil `ScaffoldMessenger` di dalam fungsi `async`
- Tidak ada kode tidak terpakai (no dead code)

---

## Validasi Akhir (Section M & N)

### Checklist Fungsional
- [ ] `flutter analyze` tidak menampilkan error
- [ ] `flutter run` berhasil tanpa crash
- [ ] Semua tombol di `HomePage` membuka halaman yang benar
- [ ] `SettingsPage` terdaftar di routes dan bisa dibuka
- [ ] `CoursePage` menampilkan 7 course dengan subtitle berbeda
- [ ] Icon item list berganti antara `Icons.school` dan `Icons.menu_book`
- [ ] `DetailPage` menampilkan judul, kategori, dan durasi dari arguments `Map`
- [ ] Tombol **Simpan Course** mengirim pesan balik berbeda dari tombol **Pilih Course dan Kembali**
- [ ] `SnackBar` muncul di `CoursePage` setelah kembali dari `DetailPage`
- [ ] `KatalogHomePage` punya 5 item buku dan `FloatingActionButton`
- [ ] `KatalogDetailPage` menerima arguments Map dan menampilkan semua field buku
- [ ] `KatalogProfilPage` dibuka via `MaterialPageRoute` (bukan named route)
- [ ] Tidak ada overflow di layar emulator
- [ ] File `laporan_praktikum.md` sudah dibuat dengan template lengkap

### Checklist Rubrik (Section M)
| Aspek | Bobot | Target |
|---|---|---|
| Kebenaran konsep route | 20% | Setiap halaman dipisah dalam class sendiri yang jelas |
| Penggunaan Navigator | 25% | push() dan pop() berjalan sesuai fungsi di semua halaman |
| Penggunaan named routes | 20% | `initialRoute` dan `routes` terdefinisi benar, minimal 6 routes |
| Pengiriman dan pengembalian data | 15% | Arguments Map terkirim, hasil balik ditangkap dan tampil di SnackBar |
| Kerapian layout | 10% | Rapi, tidak overflow, jarak konsisten |
| Kerapian kode | 10% | Indentasi jelas, nama class mudah dipahami, komentar tugas ada |

---

## Penanganan Error Umum (Section N)

| Masalah | Solusi |
|---|---|
| Tombol tidak membuka halaman | Pastikan `onPressed` berisi `Navigator.push` atau `pushNamed` dengan `context` yang benar |
| Error route tidak ditemukan | Periksa `routes` di `PraktikumApp` dan pastikan nama route tidak salah ketik |
| Tidak bisa kembali | Pastikan halaman dibuka dengan `push` sebelum memanggil `pop` |
| Error casting arguments | Samakan tipe data yang dikirim (`Map<String, String>`) dengan yang diterima di halaman tujuan |
| SnackBar tidak muncul setelah kembali | Cek `hasil != null` dan tambahkan `if (context.mounted)` sebelum `ScaffoldMessenger` |
| Tombol back AppBar tidak muncul | Pastikan halaman dibuka melalui `Navigator.push` dan menggunakan `Scaffold` dengan `AppBar` |

---

## Output yang Diharapkan

Dua file hasil kerja:
1. `lib/main.dart` — lengkap, bisa langsung di-run, mencakup semua tugas 1–5, rapi, memenuhi rubrik
2. `laporan_praktikum.md` — template laporan siap diisi
