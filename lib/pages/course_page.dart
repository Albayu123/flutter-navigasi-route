import 'package:flutter/material.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({super.key});

  // Tugas 2 & Tugas 3: Daftar course diperluas dengan subtitle unik, kategori, dan durasi per item
  final List<Map<String, String>> courses = const [
    {
      'judul': 'Flutter Dasar',
      'subtitle': 'Widget, Text, Icon, Button',
      'kategori': 'Mobile',
      'durasi': '2 jam'
    },
    {
      'judul': 'Route dan Navigasi',
      'subtitle': 'Push, Pop, Named Routes',
      'kategori': 'Mobile',
      'durasi': '1.5 jam'
    },
    {
      'judul': 'Form dan Input',
      'subtitle': 'TextField, Validasi, Form',
      'kategori': 'Mobile',
      'durasi': '2 jam'
    },
    {
      'judul': 'Layout Widget',
      'subtitle': 'Container, Card, Expanded',
      'kategori': 'Mobile',
      'durasi': '1.5 jam'
    },
    {
      'judul': 'State Management',
      'subtitle': 'setState, Provider dasar',
      'kategori': 'Arsitektur',
      'durasi': '3 jam'
    },
    {
      'judul': 'HTTP dan API',
      'subtitle': 'Fetch data dari internet',
      'kategori': 'Backend',
      'durasi': '2.5 jam'
    },
    {
      'judul': 'Firebase Dasar',
      'subtitle': 'Auth dan Firestore',
      'kategori': 'Backend',
      'durasi': '3 jam'
    },
  ];

  // Tugas 3 & Tugas 4: Kirim data lengkap Map dan tangkap hasil baliknya
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Course'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final Map<String, String> course = courses[index];
          return Card(
            elevation: 2,
            child: ListTile(
              // Tugas 2: Icon bergantian berdasarkan indeks
              leading: Icon(
                index % 2 == 0 ? Icons.school : Icons.menu_book,
                color: Colors.blue,
              ),
              title: Text(
                course['judul'] ?? '-',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(course['subtitle'] ?? '-'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => _bukaDetail(context, course),
            ),
          );
        },
      ),
    );
  }
}
