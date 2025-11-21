import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // verifier la Connexion
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  // verifier la Création de compte
  final TextEditingController signupUsername = TextEditingController();
  final TextEditingController signupPassword = TextEditingController();
  final TextEditingController signupConfirmPassword = TextEditingController();

  DateTime? birthday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //   LOGO + BIENVENUE
                Column(
                  children: [
                    const Text(
                      "Bienvenue à Sport Défit",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 187, 134, 70),
                      ),
                    ),
                    Image.asset(
                      "images/logo.png",
                      height: 250,
                      width: 250,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //   RECTANGLE CENTRAL
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 240, 244, 217)
                        .withOpacity(0.85),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(95, 151, 95, 31),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      //        CONNEXION

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Connexion",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: loginUsername,
                              decoration: const InputDecoration(
                                labelText: "Nom d'utilisateur",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: loginPassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Mot de passe",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 187, 134, 70),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                              onPressed: () {
                                if (loginUsername.text.isEmpty ||
                                    loginPassword.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          " Veuillez remplir tous les champs"),
                                      backgroundColor: Color.fromARGB(255, 76, 52, 2),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, '/accueil');
                                }
                              },
                              child: const Text("Se connecter"),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 40),
                      Container(width: 1, height: 250, color: Colors.brown),
                      const SizedBox(width: 40),

                      //      CRÉATION DE COMPTE
          
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Créer un compte",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextField(
                              controller: signupUsername,
                              decoration: const InputDecoration(
                                labelText: "Nom d'utilisateur",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: signupPassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Mot de passe",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),
                            TextField(
                              controller: signupConfirmPassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Confirmer votre mot de passe",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Date de naissance
                            GestureDetector(
                              onTap: () async {
                                DateTime? d = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2005),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                );
                                if (d != null) {
                                  setState(() => birthday = d);
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          const Color.fromARGB(255, 158, 158, 158)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  birthday == null
                                      ? "Date de naissance"
                                      : "${birthday!.day}/${birthday!.month}/${birthday!.year}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 187, 134, 70),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                              ),
                              onPressed: () {
                                String pass = signupPassword.text.trim();
                                String confirm =
                                    signupConfirmPassword.text.trim();
                                String username = signupUsername.text.trim();

                                if (username.isEmpty ||
                                    pass.isEmpty ||
                                    confirm.isEmpty ||
                                    birthday == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text(" Veuillez remplir tous les champs"),
                                      backgroundColor: Color.fromARGB(255, 83, 44, 5),
                                    ),
                                  );
                                } else if (pass != confirm) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          " Les mots de passe ne sont pas identiques"),
                                      backgroundColor: Color.fromARGB(255, 83, 44, 5),
                                    ),
                                  );
                                } else {
                                  Navigator.pushReplacementNamed(
                                      context, '/accueil');
                                }
                              },
                              child: const Text("Créer le compte"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
