import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState with ChangeNotifier {
  Map<String, dynamic>? _currentUser;
  Map<String, dynamic>? get currentUser => _currentUser;

  bool _isDarkMode = false;
  String _language = 'Francais';
  String _noteDeplacement = '';
  bool _notifications = true;

  bool get isDarkMode => _isDarkMode;
  String get language => _language;
  String get noteDeplacement => _noteDeplacement;
  bool get notifications => _notifications;

  List<Map<String, dynamic>> _userDefis = [];
  List<Map<String, dynamic>> get userDefis => _userDefis;

  // Stockage des données
  List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _allDefis = [];

  // ========== INITIALISATION ==========

  AppState() {
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await _loadUsers();
    await _loadDefis();
    await _loadSettings();
  }

  // ========== GESTION UTILISATEURS ==========

  Future<void> _loadUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final usersJson = prefs.getString('users');
      if (usersJson != null) {
        _allUsers = _parseStorageData(usersJson);
        print('${_allUsers.length} utilisateur(s) chargé(s)');
      }
    } catch (e) {
      print('Erreur chargement utilisateurs: $e');
    }
  }

  Future<void> _saveUsers() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('users', _allUsers.toString());
    } catch (e) {
      print('Erreur sauvegarde utilisateurs: $e');
    }
  }

  // ========== GESTION DÉFIS ==========

  Future<void> _loadDefis() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final defisJson = prefs.getString('defis');
      if (defisJson != null) {
        _allDefis = _parseStorageData(defisJson);
        if (_currentUser != null) {
          _userDefis = _allDefis
              .where((defi) => defi['userId'] == _currentUser!['id'])
              .toList();
        }
        print('${_allDefis.length} défi(s) chargé(s)');
      }
    } catch (e) {
      print('Erreur chargement défis: $e');
    }
  }

  Future<void> _saveDefis() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('defis', _allDefis.toString());
    } catch (e) {
      print('Erreur sauvegarde défis: $e');
    }
  }

  // ========== GESTION PARAMÈTRES ==========

  Future<void> _loadSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _isDarkMode = prefs.getBool('isDarkMode') ?? false;
      _language = prefs.getString('language') ?? 'Francais';
      _noteDeplacement = prefs.getString('noteDeplacement') ?? '';
      _notifications = prefs.getBool('notifications') ?? true;
    } catch (e) {
      print('Erreur chargement paramètres: $e');
    }
  }

  Future<void> _saveSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDarkMode', _isDarkMode);
      await prefs.setString('language', _language);
      await prefs.setString('noteDeplacement', _noteDeplacement);
      await prefs.setBool('notifications', _notifications);
    } catch (e) {
      print('Erreur sauvegarde paramètres: $e');
    }
  }

  // ========== GESTION PROFIL UTILISATEUR ==========

  Future<void> updateUserProfile(
    String nom,
    String prenom,
    String dateNaissance,
  ) async {
    if (_currentUser == null) return;

    try {
      // Mettre à jour l'utilisateur courant
      _currentUser!['nom'] = nom;
      _currentUser!['prenom'] = prenom;
      _currentUser!['birthday'] = dateNaissance;

      // Mettre à jour dans la liste des utilisateurs
      final userIndex = _allUsers.indexWhere(
        (user) => user['id'] == _currentUser!['id'],
      );
      if (userIndex != -1) {
        _allUsers[userIndex] = {..._currentUser!};
        await _saveUsers();
      }

      notifyListeners();
      print('Profil mis à jour: $prenom $nom');
    } catch (e) {
      print('Erreur mise à jour profil: $e');
    }
  }

  // Getters pour le profil
  String get userNom => _currentUser?['nom'] ?? '';
  String get userPrenom => _currentUser?['prenom'] ?? '';
  String get userBirthday => _currentUser?['birthday'] ?? '';
  String get userUsername => _currentUser?['username'] ?? '';

  // ========== AUTHENTIFICATION ==========

  Future<bool> login(String username, String password) async {
    try {
      print('Tentative de connexion: $username');

      final user = _allUsers.firstWhere(
        (user) => user['username'] == username && user['password'] == password,
        orElse: () => {},
      );

      if (user.isNotEmpty) {
        _currentUser = user;
        _userDefis = _allDefis
            .where((defi) => defi['userId'] == user['id'])
            .toList();
        notifyListeners();
        print('Connexion réussie: $username');
        return true;
      } else {
        print('Échec connexion: $username');
        return false;
      }
    } catch (e) {
      print('Erreur login: $e');
      return false;
    }
  }

  Future<bool> signup(String username, String password, String birthday) async {
    try {
      print('Tentative d inscription: $username');

      // Vérifier si l'utilisateur existe déjà
      final existingUser = _allUsers.any(
        (user) => user['username'] == username,
      );
      if (existingUser) {
        print('Utilisateur déjà existant: $username');
        return false;
      }

      // Créer le nouvel utilisateur
      final newUser = {
        'id': DateTime.now().millisecondsSinceEpoch,
        'username': username,
        'password': password,
        'birthday': birthday,
        'nom': '',
        'prenom': '',
      };

      _allUsers.add(newUser);
      await _saveUsers();

      _currentUser = newUser;
      _userDefis = [];
      notifyListeners();

      print('  Inscription réussie: $username');
      return true;
    } catch (e) {
      print('Erreur signup: $e');
      return false;
    }
  }

  void logout() {
    _currentUser = null;
    _userDefis.clear();
    notifyListeners();
    print('Déconnexion');
  }

  // ========== GESTION DÉFIS ==========

  Future<void> addDefi(Map<String, dynamic> defi) async {
    if (_currentUser == null) return;

    try {
      final newDefi = {
        ...defi,
        'id': DateTime.now().millisecondsSinceEpoch,
        'userId': _currentUser!['id'],
        'joursFaits': 0,
      };

      _allDefis.add(newDefi);
      _userDefis.add(newDefi);
      await _saveDefis();
      notifyListeners();

      print('Défi ajouté: ${defi['nom']}');
    } catch (e) {
      print('Erreur ajout défi: $e');
    }
  }

  Future<void> updateDefiProgress(int defiId, int joursFaits) async {
    try {
      final defiIndex = _allDefis.indexWhere((defi) => defi['id'] == defiId);
      if (defiIndex != -1) {
        _allDefis[defiIndex]['joursFaits'] = joursFaits;
        await _saveDefis();

        final userDefiIndex = _userDefis.indexWhere(
          (defi) => defi['id'] == defiId,
        );
        if (userDefiIndex != -1) {
          _userDefis[userDefiIndex]['joursFaits'] = joursFaits;
        }

        notifyListeners();
      }
    } catch (e) {
      print('Erreur mise à jour progression: $e');
    }
  }

  Future<void> deleteDefi(int defiId) async {
    try {
      _allDefis.removeWhere((defi) => defi['id'] == defiId);
      _userDefis.removeWhere((defi) => defi['id'] == defiId);
      await _saveDefis();
      notifyListeners();
    } catch (e) {
      print('Erreur suppression défi: $e');
    }
  }

  // ========== PARAMÈTRES ==========

  Future<void> toggleDarkMode(bool value) async {
    _isDarkMode = value;
    await _saveSettings();
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    _language = newLanguage;
    await _saveSettings();
    notifyListeners();
  }

  Future<void> updateNoteDeplacement(String note) async {
    _noteDeplacement = note;
    await _saveSettings();
    notifyListeners();
  }

  Future<void> toggleNotifications(bool value) async {
    _notifications = value;
    await _saveSettings();
    notifyListeners();
  }

  // ========== UTILITAIRES ==========

  List<Map<String, dynamic>> _parseStorageData(String data) {
    try {
      if (data == '[]') return [];

      final List<Map<String, dynamic>> result = [];
      final items = data.substring(1, data.length - 1).split('}, {');

      for (var item in items) {
        final cleanedItem = item.replaceAll('{', '').replaceAll('}', '');
        final pairs = cleanedItem.split(', ');
        final Map<String, dynamic> map = {};

        for (var pair in pairs) {
          final keyValue = pair.split(': ');
          if (keyValue.length == 2) {
            var key = keyValue[0].trim();
            var value = keyValue[1].trim();

            // Nettoyer les guillemets
            key = key.replaceAll("'", "");
            value = value.replaceAll("'", "");

            // Convertir les types
            if (key == 'id' ||
                key == 'userId' ||
                key == 'jours' ||
                key == 'joursFaits' ||
                key == 'personnes') {
              map[key] = int.tryParse(value) ?? value;
            } else if (key == 'isDarkMode' || key == 'notifications') {
              map[key] = value == 'true';
            } else {
              map[key] = value;
            }
          }
        }

        if (map.isNotEmpty) {
          result.add(map);
        }
      }

      return result;
    } catch (e) {
      print('Erreur parsing data: $e');
      return [];
    }
  }

  // ========== DEBUG ==========

  void debugShowUsers() {
    print('=== DONNÉES DE L\'APPLICATION ===');

    // Utilisateurs
    print('👥 UTILISATEURS (${_allUsers.length}):');
    for (var user in _allUsers) {
      print('   - ${user['username']} (ID: ${user['id']})');
      print('     Nom: ${user['nom']}');
      print('     Prénom: ${user['prenom']}');
      print('     Date: ${user['birthday']}');
    }

    // Défis
    print('\n   DÉFIS (${_allDefis.length}):');
    for (var defi in _allDefis) {
      print('   - ${defi['nom']} (UserID: ${defi['userId']})');
      print('     Desc: ${defi['description']}');
      print('     Jours: ${defi['jours']}/${defi['joursFaits']}');
    }

    // Utilisateur courant
    print('\n   UTILISATEUR COURANT:');
    if (_currentUser != null) {
      print('   - ${_currentUser!['username']}');
      print('   - Défis: ${_userDefis.length}');
    } else {
      print('   - Aucun utilisateur connecté');
    }

    print('====================================');
  }

  bool get isLoggedIn => _currentUser != null;
  String get username => _currentUser?['username'] ?? '';
}
