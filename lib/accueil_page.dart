import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
class MesDefis {
  static List<Map<String, dynamic>> liste = [];
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
}

Widget defiCard({
  required BuildContext context, 
  required String image,
  required String nom,
  required int personnes,
  required int jours,
  required String description,
}) {
<<<<<<< HEAD
  final appState = Provider.of<AppState>(context);

=======
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
  return Card(
    color: Colors.white.withOpacity(0.1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
<<<<<<< HEAD
=======
          // Image du défi
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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

<<<<<<< HEAD
=======
          // Infos du défi
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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

<<<<<<< HEAD
=======
                // ON AJOUTE LE DÉFI À LA LISTE + NAVIGATION
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
                    appState.addDefi({
=======
                    MesDefis.liste.add({
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                      "image": image,
                      "nom": nom,
                      "personnes": personnes,
                      "jours": jours,
                      "description": description,
<<<<<<< HEAD
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
=======
                    });

                    Navigator.pushNamed(context, '/progression');
                  },
                  child: const Text("Ajouter à mes défis "),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
          Image.asset("images/background.png", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),

=======
          // Image de fond
          Image.asset("images/background.png", fit: BoxFit.cover),
          Container(color: Colors.black.withOpacity(0.5)),

          // Logo 
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
          Positioned(
            top: 5,
            left: 20,
            child: Image.asset(
              "images/logo.png",
              width: 160,
              height: 160,
            ),
          ),

<<<<<<< HEAD
=======
          // Icône profil 
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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

<<<<<<< HEAD
=======
          // Contenu central 
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
                    "Defis des autres",
=======
                    "Défis des autres",
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),

<<<<<<< HEAD
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
=======
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
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                    ),
                  ),
                ],
              ),
            ),
          ),

<<<<<<< HEAD
=======
          // BARRE DU BAS
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
=======
                  // retourner a la page d'acceuil
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/accueil');
                    },
                  ),
<<<<<<< HEAD
=======
                  // allez a la page d'ajouter
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
=======
                  // allez a la page progression
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () {
                      Navigator.pushNamed(context, '/progression');
                    },
                  ),
<<<<<<< HEAD
=======
                  // aller a la page Profil
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
          
=======
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
        ],
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
