import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class AjouterDefitPage extends StatefulWidget {
  const AjouterDefitPage({super.key});

  @override
  State<AjouterDefitPage> createState() => _AjouterDefitPageState();
}

class _AjouterDefitPageState extends State<AjouterDefitPage> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController joursController = TextEditingController();

  String selectedImage = "images/defit3.jpeg";

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

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

          Padding(
            padding: const EdgeInsets.only(bottom: 120),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/logo.png",
                        height: 80,
                        width: 80,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Creer un defi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
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
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  inputField("Nom du defi", nomController),
                  const SizedBox(height: 15),
                  inputField("Description du defi", descriptionController, maxLines: 3),
                  const SizedBox(height: 15),
                  inputField("Nombre de jours", joursController,
                      keyboardType: TextInputType.number),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (nomController.text.isEmpty ||
                          descriptionController.text.isEmpty ||
                          joursController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Veuillez remplir tous les champs"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      int nbJours = int.tryParse(joursController.text) ?? 0;

                      if (nbJours == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Le nombre de jours doit etre superieur a 0"),
                            backgroundColor: Colors.red,
                          ),
                        );
                        return;
                      }

                      appState.addDefi({
                        "image": selectedImage,
                        "nom": nomController.text,
                        "description": descriptionController.text,
                        "jours": nbJours,
                        "joursFaits": 0,
                        "personnes": 0,
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Defi cree avec succes !"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pushNamed(context, "/progression");
                    },
                    child: const Text("Creer le defi", style: TextStyle(fontSize: 18)),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
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

  Widget inputField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
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
      ),
    );
  }
}