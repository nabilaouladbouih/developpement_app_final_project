import 'package:flutter/material.dart';
import 'accueil_page.dart';

class ProgressionPage extends StatefulWidget {
  const ProgressionPage({super.key});

  @override
  State<ProgressionPage> createState() => _ProgressionPageState();
}

class _ProgressionPageState extends State<ProgressionPage> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
