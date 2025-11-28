import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'app_state.dart';
=======
import 'accueil_page.dart';
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a

class ProgressionPage extends StatefulWidget {
  const ProgressionPage({super.key});

  @override
  State<ProgressionPage> createState() => _ProgressionPageState();
}

class _ProgressionPageState extends State<ProgressionPage> {
<<<<<<< HEAD
  static const Color beige = Color(0xFFF5F5DC);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

=======
  @override
  Widget build(BuildContext context) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),

<<<<<<< HEAD
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/logo.png",
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Mes defis",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 120),
            child: appState.userDefis.isEmpty
                ? const Center(
                    child: Text(
                      "Aucun defi ajoute",
                      style: TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 140),
                    itemCount: appState.userDefis.length,
                    itemBuilder: (context, index) {
                      final defi = appState.userDefis[index];

                      final int totalJours = (defi['jours'] ?? 1).toInt();
                      final int joursFaits = (defi['joursFaits'] ?? 0).toInt();

                      double progress = (joursFaits / (totalJours == 0 ? 1 : totalJours))
                          .clamp(0.0, 1.0);

                      return Card(
                        color: Colors.white.withOpacity(0.08),
                        margin: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  defi['image'],
                                  height: 120,
                                  width: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      defi['nom'] ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  IconButton(
                                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            backgroundColor: Colors.black87,
                                            title: const Text(
                                              "Supprimer le defi",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            content: const Text(
                                              "Es-tu sûr(e) de vouloir supprimer ce defi ?",
                                              style: TextStyle(color: Colors.white70),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: const Text("Annuler"),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  appState.deleteDefi(defi['id']);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Supprimer",
                                                  style: TextStyle(color: Colors.redAccent),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),

                              const SizedBox(height: 5),

                              Text(
                                "$joursFaits/$totalJours jours",
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),

                              const SizedBox(height: 8),

                              LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.white24,
                                color: Colors.purpleAccent,
                                minHeight: 10,
                              ),

                              const SizedBox(height: 12),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (joursFaits > 0) {
                                        appState.updateDefiProgress(defi['id'], joursFaits - 1);
                                      }
                                    },
                                    icon: const Icon(Icons.remove_circle, size: 34),
                                    color: beige,
                                  ),

                                  const SizedBox(width: 24),

                                  IconButton(
                                    onPressed: () {
                                      if (joursFaits < totalJours) {
                                        appState.updateDefiProgress(defi['id'], joursFaits + 1);
                                      }
                                    },
                                    icon: const Icon(Icons.add_circle, size: 34),
                                    color: beige,
                                  ),

                                  const SizedBox(width: 24),

                                  IconButton(
                                    onPressed: () {
                                      appState.updateDefiProgress(defi['id'], 0);
                                    },
                                    icon: const Icon(Icons.restart_alt, size: 34),
                                    color: beige,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: beige,
                    iconSize: 30,
                    onPressed: () => Navigator.pushNamed(context, '/accueil'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: beige,
                      iconSize: 30,
                      onPressed: () => Navigator.pushNamed(context, '/ajouter'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: beige,
                    iconSize: 30,
                    onPressed: () => Navigator.pushNamed(context, '/progression'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    color: beige,
                    iconSize: 30,
                    onPressed: () => Navigator.pushNamed(context, '/profil'),
                  ),
                ],
              ),
            ),
          ),
=======
          MesDefis.liste.isEmpty
              ? const Center(
                  child: Text(
                    "Aucun défi ajouté",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: MesDefis.liste.length,
                  itemBuilder: (context, index) {
                    final defi = MesDefis.liste[index];
                    double totalJours = (defi['jours'] ?? 1).toDouble();
                    double joursFaits = (defi['joursFaits'] ?? 0).toDouble();
                    double progress = (joursFaits / totalJours).clamp(0.0, 1.0);
                    bool isCompleted = joursFaits >= totalJours;

                    return Card(
                      color: Colors.white.withOpacity(0.1),
                      margin: const EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                defi['image'],
                                height: 120,
                                width: 120,
                                fit: BoxFit.cover, // carré
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              defi['nom'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${joursFaits.toInt()}/${totalJours.toInt()} jours",
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.white24,
                              color: Colors.purpleAccent,
                              minHeight: 10,
                            ),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: isCompleted
                                  ? null
                                  : () {
                                      setState(() {
                                        defi['joursFaits'] =
                                            (defi['joursFaits'] ?? 0) + 1;
                                      });
                                    },
                              child: Text(
                                  isCompleted ? "Défi terminé !" : "Marquer comme fait"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
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
