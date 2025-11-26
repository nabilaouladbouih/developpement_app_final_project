import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool notificationActive = true;
  String langueSelectionnee = "Français";
  bool isDarkMode = false; // false = light mode, true = dark mode

  void _afficherChoixApparence(BuildContext context) {
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
                  _afficherMessageApparence(context, "Light mode");
                },
              ),
              ListTile(
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
                  _afficherMessageApparence(context, "Dark mode");
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
                  _afficherMessageLangue(context, "English");
                },
              ),
            ],
          ),
        );
      },
    );
  }

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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
            ),
          ],
        );
      },
    );
  }

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

          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 200),
              ],
            ),
          ),

          // ----- BARRE DE NAVIGATION DU BAS -----
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? Colors.grey[800]!
                    : Colors.black.withOpacity(0.6),
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

  // ---- Widget item menu simple ----
  Widget _item(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
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
        ],
      ),
    );
  }

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
    return Divider(
      color: isDarkMode ? Colors.white54 : Colors.grey.withOpacity(0.3),
      thickness: 1,
      height: 8,
    );
  }
}
