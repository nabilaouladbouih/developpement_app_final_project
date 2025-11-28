import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'app_state.dart';
=======
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
<<<<<<< HEAD
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

=======
  // verifier la Connexion
  final TextEditingController loginUsername = TextEditingController();
  final TextEditingController loginPassword = TextEditingController();

  // verifier la Création de compte
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
  final TextEditingController signupUsername = TextEditingController();
  final TextEditingController signupPassword = TextEditingController();
  final TextEditingController signupConfirmPassword = TextEditingController();

  DateTime? birthday;
<<<<<<< HEAD
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

=======

  @override
  Widget build(BuildContext context) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
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
<<<<<<< HEAD
          child: _isLoading 
              ? const CircularProgressIndicator(color: Colors.white)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Bienvenue a Sport Defit",
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
                                    onPressed: () async {
                                      if (loginUsername.text.isEmpty ||
                                          loginPassword.text.isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                " Veuillez remplir tous les champs"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        return;
                                      }

                                      setState(() => _isLoading = true);

                                      final success = await appState.login(
                                        loginUsername.text.trim(), 
                                        loginPassword.text.trim()
                                      );
                                      
                                      setState(() => _isLoading = false);

                                      if (success) {
                                        Navigator.pushReplacementNamed(context, '/accueil');
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Nom d'utilisateur ou mot de passe incorrect"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
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

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Creer un compte",
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
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_today,
                                            color: birthday == null 
                                                ? Colors.grey 
                                                : const Color.fromARGB(255, 187, 134, 70),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            birthday == null
                                                ? "Date de naissance"
                                                : "${birthday!.day}/${birthday!.month}/${birthday!.year}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: birthday == null ? Colors.grey : Colors.black,
                                            ),
                                          ),
                                        ],
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
                                    onPressed: () async {
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
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        return;
                                      } else if (pass != confirm) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                " Les mots de passe ne sont pas identiques"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        return;
                                      } else if (pass.length < 3) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                " Le mot de passe doit contenir au moins 3 caracteres"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        return;
                                      }

                                      setState(() => _isLoading = true);

                                      final success = await appState.signup(
                                        username, 
                                        pass, 
                                        "${birthday!.day}/${birthday!.month}/${birthday!.year}"
                                      );
                                      
                                      setState(() => _isLoading = false);

                                      if (success) {
                                        Navigator.pushReplacementNamed(context, '/accueil');
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text("Ce nom d'utilisateur est deja pris"),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    },
                                    child: const Text("Creer le compte"),
                                  ),
                                ],
                              ),
                            ),
=======
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
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                          ],
                        ),
                      ),

<<<<<<< HEAD
                      // BOUTONS DEBUG (temporaires)
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
=======
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
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                        ),
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
=======
              ],
            ),
          ),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
