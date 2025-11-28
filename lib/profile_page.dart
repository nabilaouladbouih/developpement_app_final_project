import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'app_state.dart';
=======
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
<<<<<<< HEAD
  TextEditingController noteController = TextEditingController();

  // Methodes pour les couleurs
  Color _getBackgroundColor(bool isDarkMode) =>
      isDarkMode ? Colors.grey[900]! : const Color(0xFFF8EDED);

  Color _getTextColor(bool isDarkMode) =>
      isDarkMode ? Colors.white : Colors.black;

  Color _getCardColor(bool isDarkMode) => isDarkMode
      ? Colors.grey[800]!
      : const Color.fromARGB(255, 240, 244, 217).withOpacity(0.85);

  Color _getPrimaryColor(bool isDarkMode) =>
      isDarkMode ? Colors.blueGrey : const Color.fromARGB(255, 187, 134, 70);

  // Methodes pour les messages
  void _afficherMessageApparence(BuildContext context, String mode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Mode apparence change en $mode"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
      ),
    );
  }

  void _afficherMessageLangue(BuildContext context, String langue) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Langue changee en $langue"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
      ),
    );
  }

  void _afficherMessageProfil(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profil mis a jour avec succes"),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Methodes pour les popups
  void _afficherChoixApparence(BuildContext context, bool isDarkMode, AppState appState) {
=======
  bool notificationActive = true;
  String langueSelectionnee = "Français";
  bool isDarkMode = false; // false = light mode, true = dark mode

  void _afficherChoixApparence(BuildContext context) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choisir l'apparence",
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
<<<<<<< HEAD
                leading: Icon(Icons.light_mode,
                    color: isDarkMode ? Colors.white : Colors.black),
                title: Text("Light mode",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black)),
                trailing:
                    !isDarkMode ? const Icon(Icons.check, color: Colors.green) : null,
                onTap: () {
                  appState.toggleDarkMode(false);
                  Navigator.pop(context);
=======
                leading: Icon(
                  Icons.light_mode,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                title: Text(
                  "Light mode",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                trailing: !isDarkMode
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    isDarkMode = false;
                  });
                  Navigator.of(context).pop();
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  _afficherMessageApparence(context, "Light mode");
                },
              ),
              ListTile(
<<<<<<< HEAD
                leading: Icon(Icons.dark_mode,
                    color: isDarkMode ? Colors.white : Colors.black),
                title: Text("Dark mode",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black)),
                trailing:
                    isDarkMode ? const Icon(Icons.check, color: Colors.green) : null,
                onTap: () {
                  appState.toggleDarkMode(true);
                  Navigator.pop(context);
=======
                leading: Icon(
                  Icons.dark_mode,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                title: Text(
                  "Dark mode",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                trailing: isDarkMode
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    isDarkMode = true;
                  });
                  Navigator.of(context).pop();
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  _afficherMessageApparence(context, "Dark mode");
                },
              ),
            ],
          ),
        );
      },
    );
  }

<<<<<<< HEAD
  void _afficherChoixLangue(BuildContext context, bool isDarkMode, AppState appState) {
=======
  void _afficherMessageApparence(BuildContext context, String mode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Mode apparence changé en $mode"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _afficherChoixLangue(BuildContext context) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Choisir la langue",
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
<<<<<<< HEAD
                leading:
                    Icon(Icons.language, color: isDarkMode ? Colors.white : Colors.black),
                title: Text("Francais",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black)),
                trailing: appState.language == "Francais"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  appState.changeLanguage("Francais");
                  Navigator.pop(context);
                  _afficherMessageLangue(context, "Francais");
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.language, color: isDarkMode ? Colors.white : Colors.black),
                title: Text("English",
                    style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black)),
                trailing: appState.language == "English"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  appState.changeLanguage("English");
                  Navigator.pop(context);
=======
                leading: Icon(
                  Icons.language,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                title: Text(
                  "Français",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                trailing: langueSelectionnee == "Français"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    langueSelectionnee = "Français";
                  });
                  Navigator.of(context).pop();
                  _afficherMessageLangue(context, "Français");
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
                title: Text(
                  "English",
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                trailing: langueSelectionnee == "English"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    langueSelectionnee = "English";
                  });
                  Navigator.of(context).pop();
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  _afficherMessageLangue(context, "English");
                },
              ),
            ],
          ),
        );
      },
    );
  }

<<<<<<< HEAD
  void _ouvrirNoteDeDeplacement(BuildContext context, bool isDarkMode, AppState appState) {
    noteController.text = appState.noteDeplacement;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Note de deplacement",
            style: TextStyle(color: _getTextColor(isDarkMode)),
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: TextField(
            controller: noteController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: "Ecrivez votre note ici...",
              hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white54 : Colors.black54),
              border: const OutlineInputBorder(),
            ),
            style: TextStyle(color: _getTextColor(isDarkMode)),
          ),
          actions: [
            TextButton(
              child: Text("Annuler", style: TextStyle(color: _getTextColor(isDarkMode))),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Enregistrer", style: TextStyle(color: Colors.green)),
              onPressed: () {
                appState.updateNoteDeplacement(noteController.text);
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Note enregistree !"),
                    backgroundColor: Color.fromARGB(255, 187, 134, 70),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _modifierProfil(BuildContext context, bool isDarkMode, AppState appState) {
    TextEditingController nomController = TextEditingController(text: appState.userNom);
    TextEditingController prenomController = TextEditingController(text: appState.userPrenom);
    TextEditingController dateController = TextEditingController(text: appState.userBirthday);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Modifier le profil", style: TextStyle(color: _getTextColor(isDarkMode))),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nomController,
                  decoration: InputDecoration(
                    labelText: "Nom",
                    labelStyle: TextStyle(color: _getTextColor(isDarkMode)),
                    border: const OutlineInputBorder(),
                  ),
                  style: TextStyle(color: _getTextColor(isDarkMode)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: prenomController,
                  decoration: InputDecoration(
                    labelText: "Prenom",
                    labelStyle: TextStyle(color: _getTextColor(isDarkMode)),
                    border: const OutlineInputBorder(),
                  ),
                  style: TextStyle(color: _getTextColor(isDarkMode)),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    labelText: "Date de naissance (JJ/MM/AAAA)",
                    labelStyle: TextStyle(color: _getTextColor(isDarkMode)),
                    border: const OutlineInputBorder(),
                  ),
                  style: TextStyle(color: _getTextColor(isDarkMode)),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Annuler", style: TextStyle(color: _getTextColor(isDarkMode))),
            ),
            TextButton(
              onPressed: () {
                appState.updateUserProfile(
                  nomController.text,
                  prenomController.text,
                  dateController.text,
                );
                Navigator.pop(context);
                _afficherMessageProfil(context);
              },
              child: const Text("Enregistrer", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }

  void _deconnexion(BuildContext context, bool isDarkMode, AppState appState) {
=======
  void _afficherMessageLangue(BuildContext context, String langue) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Langue changée en $langue"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _deconnexion(BuildContext context) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
<<<<<<< HEAD
          title: Text("Deconnexion",
              style: TextStyle(color: _getTextColor(isDarkMode))),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: Text("Etes-vous sûr de vouloir vous deconnecter ?",
              style: TextStyle(color: _getTextColor(isDarkMode))),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Annuler", style: TextStyle(color: _getTextColor(isDarkMode)))),
            TextButton(
              onPressed: () {
                appState.logout();
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Deconnexion", style: TextStyle(color: Colors.red)),
=======
          title: Text(
            "Déconnexion",
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: Text(
            "Êtes-vous sûr de vouloir vous déconnecter ?",
            style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Annuler",
                style: TextStyle(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                "Déconnexion",
                style: TextStyle(color: Colors.red),
              ),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
            ),
          ],
        );
      },
    );
  }

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isDarkMode = appState.isDarkMode;
    final language = appState.language;
    final notifications = appState.notifications;

    return Scaffold(
      backgroundColor: _getBackgroundColor(isDarkMode),
      body: Stack(
        children: [
          if (!isDarkMode)
            Positioned.fill(
              child: Image.asset("images/background.png", fit: BoxFit.cover),
            ),
=======
  Color _getBackgroundColor() {
    return isDarkMode ? Colors.grey[900]! : const Color(0xFFF8EDED);
  }

  Color _getTextColor() {
    return isDarkMode ? Colors.white : Colors.black;
  }

  Color _getCardColor() {
    return isDarkMode
        ? Colors.grey[800]!
        : const Color.fromARGB(255, 240, 244, 217).withOpacity(0.85);
  }

  Color _getPrimaryColor() {
    return isDarkMode
        ? Colors.blueGrey
        : const Color.fromARGB(255, 187, 134, 70);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      body: Stack(
        children: [
          // -------- BACKGROUND --------
          if (!isDarkMode) // Afficher le background seulement en light mode
            Positioned.fill(
              child: Image.asset("images/background.png", fit: BoxFit.cover),
            ),

>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
<<<<<<< HEAD
                Center(child: Image.asset('images/logo.png', height: 140)),
                const SizedBox(height: 10),
                Text("Profil",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: _getPrimaryColor(isDarkMode))),
                const SizedBox(height: 25),
                
                // BONJOUR + USERNAME
=======

                // LOGO SPORTDEFIT
                Center(child: Image.asset('images/logo.png', height: 140)),

                const SizedBox(height: 10),

                Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: _getPrimaryColor(),
                  ),
                ),

                const SizedBox(height: 25),

                // Bonjour + Nom + Avatar
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
<<<<<<< HEAD
                      Text("Bonjour ",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: _getTextColor(isDarkMode))),
                      Text(appState.userUsername.isNotEmpty ? appState.userUsername : appState.username,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: _getTextColor(isDarkMode))),
                      const Spacer(),
                      Icon(Icons.account_circle,
                          size: 40, color: _getPrimaryColor(isDarkMode)),
                    ],
                  ),
                ),
                
                // INFOS PROFIL
                if (appState.userPrenom.isNotEmpty || appState.userNom.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _getCardColor(isDarkMode),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, color: _getPrimaryColor(isDarkMode)),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (appState.userPrenom.isNotEmpty && appState.userNom.isNotEmpty)
                                Text(
                                  "${appState.userPrenom} ${appState.userNom}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: _getTextColor(isDarkMode),
                                  ),
                                ),
                              if (appState.userBirthday.isNotEmpty)
                                Text(
                                  "Né(e) le ${appState.userBirthday}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: _getTextColor(isDarkMode).withOpacity(0.7),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),
                
                // PARAMÈTRES
=======
                      Text(
                        "Bonjour ",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                          color: _getTextColor(),
                        ),
                      ),
                      Text(
                        "Ikram Sidhoum",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: _getTextColor(),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.account_circle,
                        size: 40,
                        color: _getPrimaryColor(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // CARTE PARAMÈTRES
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
<<<<<<< HEAD
                      color: _getCardColor(isDarkMode),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.black.withOpacity(0.3)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => _afficherChoixApparence(context, isDarkMode, appState),
                          child: _itemApparence(isDarkMode, appState.isDarkMode ? "Dark mode" : "Light mode"),
                        ),
                        _divider(isDarkMode),
                        _itemAvecSwitch(
                          Icons.notifications,
                          "Parametres de notification",
                          "Suggérer des resultats",
                          notifications,
                          (valeur) => appState.toggleNotifications(valeur),
                          isDarkMode,
                        ),
                        _divider(isDarkMode),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 8),
                          child: Text("Gestion du profil",
                              style: TextStyle(
                                  color: isDarkMode ? Colors.white70 : Colors.grey,
                                  fontSize: 13)),
                        ),
                        GestureDetector(
                          onTap: () => _modifierProfil(context, isDarkMode, appState),
                          child: _item(Icons.person, "Modifier le profil", isDarkMode),
                        ),
                        _divider(isDarkMode),
                        GestureDetector(
                          onTap: () => _afficherChoixLangue(context, isDarkMode, appState),
                          child: _itemLangue(isDarkMode, language),
                        ),
                        _divider(isDarkMode),
                        GestureDetector(
                          onTap: () => _deconnexion(context, isDarkMode, appState),
                          child: Row(
                            children: [
                              const Icon(Icons.logout, color: Colors.red, size: 22),
                              const SizedBox(width: 15),
                              const Text("Deconnexion",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
=======
                      color: _getCardColor(),
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Apparence avec choix
                        GestureDetector(
                          onTap: () {
                            _afficherChoixApparence(context);
                          },
                          child: _itemApparence(),
                        ),
                        _divider(),

                        _item(Icons.note, "Note de déplacement"),
                        _divider(),

                        _itemAvecSwitch(
                          Icons.notifications,
                          "Paramètres de notification",
                          "Suggérer des résultats",
                          notificationActive,
                          (valeur) {
                            setState(() {
                              notificationActive = valeur;
                            });
                          },
                        ),
                        _divider(),

                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 8),
                          child: Text(
                            "Section Titre",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white70 : Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),

                        _item(Icons.person, "Paramètres du profil"),
                        _divider(),

                        // Langue avec choix
                        GestureDetector(
                          onTap: () {
                            _afficherChoixLangue(context);
                          },
                          child: _itemLangue(),
                        ),
                        _divider(),

                        // Déconnexion
                        GestureDetector(
                          onTap: () {
                            _deconnexion(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 8,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.logout, color: Colors.red, size: 22),
                                const SizedBox(width: 15),
                                Text(
                                  "Déconnexion",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
<<<<<<< HEAD
=======

>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                const SizedBox(height: 200),
              ],
            ),
          ),
<<<<<<< HEAD
          
          // BARRE DE NAVIGATION
=======

          // ----- BARRE DE NAVIGATION DU BAS -----
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
<<<<<<< HEAD
                color: isDarkMode ? Colors.grey[800]! : Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),
=======
                color: isDarkMode
                    ? Colors.grey[800]!
                    : Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(30),
              ),

>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 30,
<<<<<<< HEAD
                    onPressed: () => Navigator.pushNamed(context, '/accueil'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.2)),
=======
                    onPressed: () {
                      Navigator.pushNamed(context, '/accueil');
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.2),
                    ),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                      iconSize: 30,
<<<<<<< HEAD
                      onPressed: () => Navigator.pushNamed(context, '/ajouter'),
=======
                      onPressed: () {
                        Navigator.pushNamed(context, '/ajouter');
                      },
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: Colors.white,
                    iconSize: 30,
<<<<<<< HEAD
                    onPressed: () => Navigator.pushNamed(context, '/progression'),
=======
                    onPressed: () {
                      Navigator.pushNamed(context, '/progression');
                    },
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: 30,
<<<<<<< HEAD
                    onPressed: () => Navigator.pushNamed(context, '/profil'),
=======
                    onPressed: () {
                      Navigator.pushNamed(context, '/profil');
                    },
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  // ====== Widgets reutilises ======
  Widget _item(IconData icon, String label, bool isDarkMode) {
=======
  // ---- Widget item menu simple ----
  Widget _item(IconData icon, String label) {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
<<<<<<< HEAD
          Icon(icon, size: 22, color: _getTextColor(isDarkMode)),
          const SizedBox(width: 15),
          Text(label,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: _getTextColor(isDarkMode))),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor(isDarkMode)),
=======
          Icon(icon, size: 22, color: _getTextColor()),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _getTextColor(),
            ),
          ),
          const Spacer(),
          Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor()),
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _itemApparence(bool isDarkMode, String currentMode) {
    return Row(
      children: [
        Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode,
            size: 22, color: _getTextColor(isDarkMode)),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Apparence",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _getTextColor(isDarkMode))),
                const SizedBox(height: 2),
                Text(currentMode,
                    style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white70 : Colors.grey)),
              ]),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor(isDarkMode))
      ],
    );
  }

  Widget _itemAvecSwitch(
      IconData icon,
      String label,
      String sousTitre,
      bool valeur,
      Function(bool) onChanged,
      bool isDarkMode) {
    return Row(
      children: [
        Icon(icon, size: 22, color: _getTextColor(isDarkMode)),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _getTextColor(isDarkMode))),
                const SizedBox(height: 2),
                Text(sousTitre,
                    style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white70 : Colors.grey)),
              ]),
        ),
        Switch(
            value: valeur,
            onChanged: onChanged,
            activeColor: _getPrimaryColor(isDarkMode))
      ],
    );
  }

  Widget _itemLangue(bool isDarkMode, String currentLanguage) {
    return Row(
      children: [
        Icon(Icons.language, size: 22, color: _getTextColor(isDarkMode)),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Langue",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _getTextColor(isDarkMode))),
                const SizedBox(height: 2),
                Text(currentLanguage,
                    style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white70 : Colors.grey)),
              ]),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor(isDarkMode))
      ],
    );
  }

  Widget _divider(bool isDarkMode) {
=======
  // ---- Widget apparence ----
  Widget _itemApparence() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            size: 22,
            color: _getTextColor(),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Apparence",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _getTextColor(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  isDarkMode ? "Dark mode" : "Light mode",
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor()),
        ],
      ),
    );
  }

  // ---- Widget item avec switch ----
  Widget _itemAvecSwitch(
    IconData icon,
    String label,
    String sousTitre,
    bool valeur,
    Function(bool) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 22, color: _getTextColor()),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _getTextColor(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  sousTitre,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: valeur,
            onChanged: onChanged,
            activeColor: _getPrimaryColor(),
          ),
        ],
      ),
    );
  }

  // ---- Widget langue ----
  Widget _itemLangue() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(Icons.language, size: 22, color: _getTextColor()),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Langue",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: _getTextColor(),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  langueSelectionnee,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: _getTextColor()),
        ],
      ),
    );
  }

  Widget _divider() {
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
    return Divider(
      color: isDarkMode ? Colors.white54 : Colors.grey.withOpacity(0.3),
      thickness: 1,
      height: 8,
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> ae33609c4ecfd386781d8a8927c2957f015ba74a
