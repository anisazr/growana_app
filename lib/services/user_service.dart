import '../models/user.dart';

class UserService {
  static final List<User> _users = [];
  static User? _currentUser;

  static List<User> get users => _users;
  static User? get currentUser => _currentUser;

  static bool register(String name, String email, int phone, String password) {
    // Check if email already exists
    if (_users.any((user) => user.email == email)) {
      return false;
    }

    _users.add(
      User(name: name, email: email, phone: phone, password: password),
    );
    return true;
  }

  static bool login(String email, String password) {
    try {
      _currentUser = _users.firstWhere(
        (user) => user.email == email && user.password == password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  static void logout() {
    _currentUser = null;
  }
}

