import 'package:flutter/material.dart';
import 'login_page.dart'; // ________________ Ikram
import 'accueil_page.dart'; // __________________ Ikram
//import 'progression_page.dart'; ____________ Page de Siga
//import 'ajouter_defit_page.dart'; _____________ Page de Nabila
// import 'profile_page.dart'; ______________ I don't remember 

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
        '/accueil': (_) => AccueilPage(),
        //  '/progression': (_) => ProgressionPage(), ********** Change here 
        //  '/ajouter': (_) => AjouterDefitPage(), ********** Change here 
        //  '/profil': (_) => ProfilePage(),  ********** Change here 
      },
    );
  }
}
