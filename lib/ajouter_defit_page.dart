import 'package:flutter/material.dart';
import 'accueil_page.dart';

class AjouterDefitPage extends StatefulWidget {
  const AjouterDefitPage({super.key});

  @override
  State<AjouterDefitPage> createState() => _AjouterDefitPageState();
}

class _AjouterDefitPageState extends State<AjouterDefitPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController joursController = TextEditingController();
  final TextEditingController personnesController = TextEditingController();

  String selectedImage = "images/defit3.jpeg"; // image par défaut

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // -------- BACKGROUND --------
          Positioned.fill(
            child: Image.asset(
              "images/background.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5)),

          // -------- CONTENU --------
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Créer un défi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                // -------- CHOIX IMAGE --------
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        dropdownColor: Colors.black87,
                        value: selectedImage,
                        isExpanded: true,
                        style: const TextStyle(color: Colors.white),
                        items: const [
                          DropdownMenuItem(
                              value: "images/sq.jpg", child: Text("Squats")),
                          DropdownMenuItem(
                              value: "images/courir.jpg", child: Text("Course")),
                          DropdownMenuItem(
                              value: "images/defit3.jpeg", child: Text("Souplesse")),
                          DropdownMenuItem(
                              value: "images/defit4.jpg", child: Text("Pompes")),
                          DropdownMenuItem(
                              value: "images/defit5.jpg", child: Text("Dips")),
                          DropdownMenuItem(
                              value: "images/defit6.jpg", child: Text("Corde")),
                          DropdownMenuItem(
                              value: "images/defis7.jpg", child: Text("Natation")),
                        ],
                        onChanged: (value) {
                          setState(() {
                            selectedImage = value!;
                          });
                        },
                      ),

                      const SizedBox(height: 12),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          selectedImage,
                          height: 180,
                          width: 180,
                          fit: BoxFit.cover, // carré
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                inputField("Nom du défi", nomController),
                const SizedBox(height: 15),
                inputField("Description du défi", descriptionController, maxLines: 3),
                const SizedBox(height: 15),
                inputField("Nombre de jours", joursController, keyboardType: TextInputType.number),
                const SizedBox(height: 15),
                inputField("Nombre de personnes", personnesController, keyboardType: TextInputType.number),
                const SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.3),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    if (nomController.text.isEmpty ||
                        descriptionController.text.isEmpty ||
                        joursController.text.isEmpty ||
                        personnesController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Veuillez remplir tous les champs"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    int nbJours = int.tryParse(joursController.text) ?? 0;
                    int nbPersonnes = int.tryParse(personnesController.text) ?? 0;

                    if (nbJours == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Le nombre de jours doit être supérieur à 0"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    MesDefis.liste.add({
                      "image": selectedImage,
                      "nom": nomController.text,
                      "description": descriptionController.text,
                      "jours": nbJours,
                      "joursFaits": 0,
                      "personnes": nbPersonnes,
                    });

                    Navigator.pushNamed(context, "/progression");
                  },
                  child: const Text("Créer le défi", style: TextStyle(fontSize: 18)),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget inputField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white54),
        ),
      ),
    );
  }
}
