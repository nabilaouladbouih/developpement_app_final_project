import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'login_page.dart';
import 'accueil_page.dart';
import 'progression_page.dart';
import 'ajouter_defit_page.dart';
import 'profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: Consumer<AppState>(
        builder: (context, appState, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              primaryColor: const Color.fromARGB(255, 187, 134, 70),
            ),
            darkTheme: ThemeData.dark(),
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/login',
            routes: {
              '/login': (_) => const LoginPage(),
              '/accueil': (_) => const AccueilPage(),
              '/ajouter': (_) => const AjouterDefitPage(),
              '/profil': (_) => const ProfilePage(),
              '/progression': (_) => const ProgressionPage(),
            },
          );
        },
      ),
    );
  }
}