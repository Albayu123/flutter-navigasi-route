import 'package:flutter/material.dart';
import 'about_page.dart';
import 'katalog_home_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.route, size: 80, color: Colors.blue),
              const SizedBox(height: 16),
              const Text(
                'Praktikum Route dan Navigasi',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Aplikasi praktikum Flutter tentang Route dan Navigasi. Menampilkan penggunaan Navigator push, pop, named routes, dan arguments.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/courses'),
                icon: const Icon(Icons.list),
                label: const Text('Buka Daftar Course'),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/profile'),
                icon: const Icon(Icons.person),
                label: const Text('Buka Profile'),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                ),
                icon: const Icon(Icons.info),
                label: const Text('Buka About dengan MaterialPageRoute'),
              ),
              // Tugas 1: Route baru /settings
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                icon: const Icon(Icons.settings),
                label: const Text('Buka Pengaturan'),
              ),
              // Tugas 5: Tantangan Mandiri
              const SizedBox(height: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
