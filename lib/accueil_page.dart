import 'package:flutter/material.dart';
class MesDefis {
  static List<Map<String, dynamic>> liste = [];
}

Widget defiCard({
  required BuildContext context, 
  required String image,
  required String nom,
  required int personnes,
  required int jours,
  required String description,
}) {
  return Card(
    color: Colors.white.withOpacity(0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          // Image du défi
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

          // Infos du défi
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

                // ON AJOUTE LE DÉFI À LA LISTE + NAVIGATION
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
                    MesDefis.liste.add({
                      "image": image,
                      "nom": nom,
                      "personnes": personnes,
                      "jours": jours,
                      "description": description,
                    });

                    Navigator.pushNamed(context, '/progression');
                  },
                  child: const Text("Ajouter à mes défis "),
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
          // Image de fond
          Image.asset("images/background.png", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),

          // Logo 
          Positioned(
            top: 5,
            left: 20,
            child: Image.asset(
              "images/logo.png",
              width: 160,
              height: 160,
            ),
          ),

          // Icône profil 
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

          // Contenu central 
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
                    "Défis des autres",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // liste des défis
                  Expanded(
                    child: ListView(
                      children: [
                        defiCard(
                          context: context,
                          image: 'images/sq.jpg',
                          nom: 'Défi de force',
                          personnes: 120,
                          jours: 30,
                          description:
                              'Faire 200 squats par jour pendant 30 jours',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/courir.jpg',
                          nom: 'Défi cardio',
                          personnes: 200,
                          jours: 30,
                          description:
                              'Courir 3 à 5 km chaque jour pendant un mois .',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/defit3.jpeg',
                          nom: 'Défi souplesse et équilibre',
                          personnes: 80,
                          jours: 60,
                          description:
                              'Équilibre sur une jambe : Tenir 1 à 5 minutes par jambe chaque jour.',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/defit4.jpg',
                          nom: 'Défi de force',
                          personnes: 75,
                          jours: 30,
                          description:
                              'Faire 50 pompes chaque jour pendant 30 jours.',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/defit5.jpg',
                          nom: 'Défi de force',
                          personnes: 99,
                          jours: 45,
                          description:
                              'Faire 100 dips sur une chaise ou un banc par jour.',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/defit6.jpg',
                          nom: 'Défi cardio',
                          personnes: 120,
                          jours: 40,
                          description:
                              'Sauter à la corde 500 fois sans interruption.',
                        ),
                        defiCard(
                          context: context,
                          image: 'images/defis7.jpg',
                          nom: 'Défis Natation — Niveau Débutante',
                          personnes: 100,
                          jours: 20,
                          description:
                              'Tenir 30 secondes sous l’eau en apnée douce.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BARRE DU BAS
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
                  // retourner a la page d'acceuil
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/accueil');
                    },
                  ),
                  // allez a la page d'ajouter
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
                  // allez a la page progression
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/progression');
                    },
                  ),
                  // aller a la page Profil
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
