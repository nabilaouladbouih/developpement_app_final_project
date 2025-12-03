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
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 187, 134, 70),
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 187, 134, 70),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            darkTheme: ThemeData.dark().copyWith(
              primaryColor: const Color.fromARGB(255, 187, 134, 70),
              scaffoldBackgroundColor: Colors.grey[900],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[800],
                foregroundColor: Colors.white,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 187, 134, 70),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            themeMode: appState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: '/login',
            routes: {
              '/login': (context) => const LoginPage(),
              '/accueil': (context) => const AccueilPage(),
              '/ajouter': (context) => const AjouterDefitPage(),
              '/profil': (context) => const ProfilePage(),
              '/progression': (context) => const ProgressionPage(),
            },
            onUnknownRoute: (settings) {
              return MaterialPageRoute(
                builder: (context) => const LoginPage(),
              );
            },
          );
        },
      ),
    );
  }
}