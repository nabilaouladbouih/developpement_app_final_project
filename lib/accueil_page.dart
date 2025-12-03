import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class MesDefis {
  static List<Map<String, dynamic>> listeDefisPublic = [
    {
      "image": "images/sq.jpg",
      "nom": "Defi de force",
      "personnes": 120,
      "jours": 30,
      "description": "Faire 200 squats par jour pendant 30 jours",
    },
    {
      "image": "images/courir.jpg",
      "nom": "Defi cardio",
      "personnes": 200,
      "jours": 30,
      "description": "Courir 3 a 5 km chaque jour pendant un mois",
    },
    {
      "image": "images/defit3.jpeg",
      "nom": "Defi souplesse et equilibre",
      "personnes": 80,
      "jours": 60,
      "description": "Equilibre sur une jambe : Tenir 1 a 5 minutes par jambe chaque jour",
    },
    {
      "image": "images/defit4.jpg",
      "nom": "Defi de force",
      "personnes": 75,
      "jours": 30,
      "description": "Faire 50 pompes chaque jour pendant 30 jours",
    },
    {
      "image": "images/defit5.jpg",
      "nom": "Defi de force",
      "personnes": 99,
      "jours": 45,
      "description": "Faire 100 dips sur une chaise ou un banc par jour",
    },
    {
      "image": "images/defit6.jpg",
      "nom": "Defi cardio",
      "personnes": 120,
      "jours": 40,
      "description": "Sauter a la corde 500 fois sans interruption",
    },
    {
      "image": "images/defis7.jpg",
      "nom": "Defis Natation - Niveau Debutante",
      "personnes": 100,
      "jours": 20,
      "description": "Tenir 30 secondes sous l eau en apnee douce",
    },
  ];
}

Widget defiCard({
  required BuildContext context,
  required String image,
  required String nom,
  required int personnes,
  required int jours,
  required String description,
}) {
  final appState = Provider.of<AppState>(context);

  return Card(
    color: Colors.white.withOpacity(0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nom,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text('$personnes personnes',
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14)),
                    const SizedBox(width: 10),
                    Text('$jours jours',
                        style: const TextStyle(
                            color: Colors.white70, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  onPressed: () {
                    appState.addDefi({
                      "image": image,
                      "nom": nom,
                      "personnes": personnes,
                      "jours": jours,
                      "description": description,
                      "joursFaits": 0,
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Defi ajoute a vos defis !"),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Navigator.pushNamed(context, '/progression');
                  },
                  child: const Text("Ajouter a mes defis"),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class AccueilPage extends StatelessWidget {
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("images/background.png", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),
          Positioned(
            top: 5,
            left: 20,
            child: Image.asset(
              "images/logo.png",
              width: 160,
              height: 160,
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.person),
              color: Colors.white,
              iconSize: 90,
              onPressed: () {
                Navigator.pushNamed(context, '/profil');
              },
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    "Defis des autres",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView(
                      children: MesDefis.listeDefisPublic.map((defi) => defiCard(
                        context: context,
                        image: defi['image']!,
                        nom: defi['nom']!,
                        personnes: defi['personnes']!,
                        jours: defi['jours']!,
                        description: defi['description']!,
                      )).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/accueil');
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pushNamed(context, '/ajouter');
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/progression');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/profil');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}