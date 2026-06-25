import 'package:flutter/material.dart';

// Tugas 5: Tantangan Mandiri - KatalogDetailPage
class KatalogDetailPage extends StatelessWidget {
  const KatalogDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> buku =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
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
              buku['judul'] ?? '-',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Penulis: ${buku['penulis'] ?? '-'}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Genre: ${buku['genre'] ?? '-'}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Jumlah Halaman: ${buku['halaman'] ?? '-'} halaman',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(
                  context,
                  'Buku "${buku['judul']}" berhasil dipinjam!',
                );
              },
              icon: const Icon(Icons.bookmark_add),
              label: const Text('Pinjam Buku'),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
