import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Méthodes pour les couleurs
  Color _getBackgroundColor(bool isDarkMode) =>
      isDarkMode ? Colors.grey[900]! : const Color(0xFFF8EDED);

  Color _getTextColor(bool isDarkMode) =>
      isDarkMode ? Colors.white : Colors.black;

  Color _getCardColor(bool isDarkMode) => isDarkMode
      ? Colors.grey[800]!
      : const Color.fromARGB(255, 240, 244, 217).withOpacity(0.85);

  Color _getPrimaryColor(bool isDarkMode) =>
      isDarkMode ? Colors.blueGrey : const Color.fromARGB(255, 187, 134, 70);

  // Méthodes pour les messages
  void _afficherMessageApparence(BuildContext context, String mode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Mode apparence changé en $mode"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
      ),
    );
  }

  void _afficherMessageLangue(BuildContext context, String langue) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Langue changée en $langue"),
        backgroundColor: const Color.fromARGB(255, 187, 134, 70),
      ),
    );
  }

  void _afficherMessageProfil(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profil mis à jour avec succès"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _afficherChoixApparence(
    BuildContext context,
    bool isDarkMode,
    AppState appState,
  ) {
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
                  appState.toggleDarkMode(false);
                  Navigator.pop(context);
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
                  appState.toggleDarkMode(true);
                  Navigator.pop(context);
                  _afficherMessageApparence(context, "Dark mode");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _afficherChoixLangue(
    BuildContext context,
    bool isDarkMode,
    AppState appState,
  ) {
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
                trailing: appState.language == "Français"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  appState.changeLanguage("Français");
                  Navigator.pop(context);
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
                trailing: appState.language == "English"
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  appState.changeLanguage("English");
                  Navigator.pop(context);
                  _afficherMessageLangue(context, "English");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _modifierProfil(
    BuildContext context,
    bool isDarkMode,
    AppState appState,
  ) {
    TextEditingController nomController = TextEditingController(
      text: appState.userNom,
    );
    TextEditingController prenomController = TextEditingController(
      text: appState.userPrenom,
    );
    TextEditingController dateController = TextEditingController(
      text: appState.userBirthday,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Modifier le profil",
            style: TextStyle(color: _getTextColor(isDarkMode)),
          ),
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
                    labelText: "Prénom",
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
              child: Text(
                "Annuler",
                style: TextStyle(color: _getTextColor(isDarkMode)),
              ),
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
              child: const Text(
                "Enregistrer",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deconnexion(BuildContext context, bool isDarkMode, AppState appState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Déconnexion",
            style: TextStyle(color: _getTextColor(isDarkMode)),
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          content: Text(
            "Êtes-vous sûr de vouloir vous déconnecter ?",
            style: TextStyle(color: _getTextColor(isDarkMode)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Annuler",
                style: TextStyle(color: _getTextColor(isDarkMode)),
              ),
            ),
            TextButton(
              onPressed: () {
                appState.logout();
                Navigator.pop(context);
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Center(child: Image.asset('images/logo.png', height: 140)),
                const SizedBox(height: 10),
                Text(
                  "Profil",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: _getPrimaryColor(isDarkMode),
                  ),
                ),
                const SizedBox(height: 25),

                // BONJOUR + USERNAME
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
                          color: _getTextColor(isDarkMode),
                        ),
                      ),
                      Text(
                        appState.userUsername.isNotEmpty
                            ? appState.userUsername
                            : appState.username,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: _getTextColor(isDarkMode),
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.account_circle,
                        size: 40,
                        color: _getPrimaryColor(isDarkMode),
                      ),
                    ],
                  ),
                ),

                // INFOS PROFIL
                if (appState.userPrenom.isNotEmpty ||
                    appState.userNom.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: _getCardColor(isDarkMode),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: _getPrimaryColor(isDarkMode),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (appState.userPrenom.isNotEmpty &&
                                  appState.userNom.isNotEmpty)
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
                                    color: _getTextColor(
                                      isDarkMode,
                                    ).withOpacity(0.7),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: _getCardColor(isDarkMode),
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
                        GestureDetector(
                          onTap: () => _afficherChoixApparence(
                            context,
                            isDarkMode,
                            appState,
                          ),
                          child: _itemApparence(
                            isDarkMode,
                            appState.isDarkMode ? "Dark mode" : "Light mode",
                          ),
                        ),
                        _divider(isDarkMode),
                        _itemAvecSwitch(
                          Icons.notifications,
                          "Paramètres de notification",
                          "Suggérer des résultats",
                          notifications,
                          (valeur) => appState.toggleNotifications(valeur),
                          isDarkMode,
                        ),
                        _divider(isDarkMode),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, bottom: 8),
                          child: Text(
                            "Gestion du profil",
                            style: TextStyle(
                              color: isDarkMode ? Colors.white70 : Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              _modifierProfil(context, isDarkMode, appState),
                          child: _item(
                            Icons.person,
                            "Modifier le profil",
                            isDarkMode,
                          ),
                        ),
                        _divider(isDarkMode),
                        GestureDetector(
                          onTap: () => _afficherChoixLangue(
                            context,
                            isDarkMode,
                            appState,
                          ),
                          child: _itemLangue(isDarkMode, language),
                        ),
                        _divider(isDarkMode),
                        GestureDetector(
                          onTap: () =>
                              _deconnexion(context, isDarkMode, appState),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.logout,
                                color: Colors.red,
                                size: 22,
                              ),
                              const SizedBox(width: 15),
                              const Text(
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 200),
              ],
            ),
          ),

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
                    onPressed: () => Navigator.pushNamed(context, '/accueil'),
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
                      onPressed: () => Navigator.pushNamed(context, '/ajouter'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.show_chart),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () =>
                        Navigator.pushNamed(context, '/progression'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    color: Colors.white,
                    iconSize: 30,
                    onPressed: () => Navigator.pushNamed(context, '/profil'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widgets
  Widget _item(IconData icon, String label, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 22, color: _getTextColor(isDarkMode)),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: _getTextColor(isDarkMode),
            ),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: _getTextColor(isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _itemApparence(bool isDarkMode, String currentMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(
            isDarkMode ? Icons.dark_mode : Icons.light_mode,
            size: 22,
            color: _getTextColor(isDarkMode),
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
                    color: _getTextColor(isDarkMode),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  currentMode,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: _getTextColor(isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _itemAvecSwitch(
    IconData icon,
    String label,
    String sousTitre,
    bool valeur,
    Function(bool) onChanged,
    bool isDarkMode,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 22, color: _getTextColor(isDarkMode)),
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
                    color: _getTextColor(isDarkMode),
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
            activeColor: _getPrimaryColor(isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _itemLangue(bool isDarkMode, String currentLanguage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(Icons.language, size: 22, color: _getTextColor(isDarkMode)),
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
                    color: _getTextColor(isDarkMode),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  currentLanguage,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: _getTextColor(isDarkMode),
          ),
        ],
      ),
    );
  }

  Widget _divider(bool isDarkMode) {
    return Divider(
      color: isDarkMode ? Colors.white54 : Colors.grey.withOpacity(0.3),
      thickness: 1,
      height: 8,
    );
  }
}
