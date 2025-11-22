import 'package:flutter/material.dart';
import 'login_page.dart';
import 'accueil_page.dart';
import 'progression_page.dart';
import 'ajouter_defit_page.dart'; // <-- Ton fichier
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginPage(),
        '/accueil': (_) => const AccueilPage(),
        '/ajouter': (_) => AjouterDefitPage(), // <-- FIXÉ !
        '/profil': (_) => ProfilePage(),
        '/progression': (_) => const ProgressionPage(),
      },
    );
  }
}
