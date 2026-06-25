import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Tugas 3: Ambil data Map dari arguments
    final Map<String, String> course =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Course'),
        centerTitle: true,
      ),
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
            const SizedBox(height: 24),
            const Text(
              'Halaman ini menerima data lengkap course dari halaman sebelumnya menggunakan arguments berupa Map.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            // Tugas 4: Tombol Simpan Course (Hasil balik berbeda)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(
                  context,
                  'Course "${course['judul']}" berhasil disimpan!',
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('Simpan Course'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pop(
                  context,
                  'Anda kembali dari course: ${course['judul']}',
                );
              },
              icon: const Icon(Icons.check),
              label: const Text('Pilih Course dan Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
