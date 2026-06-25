import 'package:flutter/material.dart';

// Tugas 5: Tantangan Mandiri - KatalogTentangPage
class KatalogTentangPage extends StatelessWidget {
  const KatalogTentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.info, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Tentang Katalog Buku',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi Katalog Buku ini adalah bagian dari Tugas 5 Praktikum Route dan Navigasi Flutter.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
