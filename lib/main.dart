import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/course_page.dart';
import 'pages/detail_page.dart';
import 'pages/profile_page.dart';
// Tugas 1: Impor SettingsPage terpisah
import 'pages/settings_page.dart';
// Tugas 5: Impor Katalog pages terpisah
import 'pages/katalog_home_page.dart';
import 'pages/katalog_detail_page.dart';
import 'pages/katalog_tentang_page.dart';

void main() {
  runApp(const PraktikumApp());
}

class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum Route dan Navigasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/courses': (context) => const CoursePage(),
        '/detail': (context) => const DetailPage(),
        '/profile': (context) => const ProfilePage(),
        // Tugas 1: Named route baru untuk SettingsPage
        '/settings': (context) => const SettingsPage(),
        // Tugas 5: Named route baru untuk Tantangan Mandiri
        '/katalog': (context) => const KatalogHomePage(),
        '/katalog/detail': (context) => const KatalogDetailPage(),
        '/katalog/tentang': (context) => const KatalogTentangPage(),
      },
    );
  }
}
