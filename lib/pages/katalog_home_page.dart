import 'package:flutter/material.dart';
import 'katalog_profil_page.dart';

// Tugas 5: Tantangan Mandiri - KatalogHomePage
class KatalogHomePage extends StatelessWidget {
  const KatalogHomePage({super.key});

  final List<Map<String, String>> bukuList = const [
    {
      'judul': 'Laskar Pelangi',
      'penulis': 'Andrea Hirata',
      'genre': 'Fiksi',
      'halaman': '529'
    },
    {
      'judul': 'Bumi',
      'penulis': 'Tere Liye',
      'genre': 'Fantasi',
      'halaman': '440'
    },
    {
      'judul': 'Negeri 5 Menara',
      'penulis': 'Ahmad Fuadi',
      'genre': 'Fiksi',
      'halaman': '423'
    },
    {
      'judul': 'Filosofi Teras',
      'penulis': 'Henry Manampiring',
      'genre': 'Self Improvement',
      'halaman': '320'
    },
    {
      'judul': 'Ronggeng Dukuh Paruk',
      'penulis': 'Ahmad Tohari',
      'genre': 'Sastra',
      'halaman': '408'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => Navigator.pushNamed(context, '/katalog/tentang'),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: bukuList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final Map<String, String> buku = bukuList[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: const Icon(Icons.book, color: Colors.blue),
              title: Text(
                buku['judul'] ?? '-',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Penulis: ${buku['penulis'] ?? '-'}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final Object? hasil = await Navigator.pushNamed(
                  context,
                  '/katalog/detail',
                  arguments: buku,
                );
                if (context.mounted && hasil != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(hasil.toString())),
                  );
                }
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KatalogProfilPage()),
          );
        },
        child: const Icon(Icons.person),
      ),
    );
  }
}
