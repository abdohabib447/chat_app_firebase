import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  String? _email;
  String? _password;
  bool _isLoading = false;
  String _errorMessage = '';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get email => _email ?? '';
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  Future<bool> registerUser() async {
    if (!formKey.currentState!.validate()) {
      _errorMessage = 'Please enter valid data';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    notifyListeners();

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _email!,
        password: _password!,
      );
      _isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        _errorMessage = 'The email is already in use.';
      } else {
        _errorMessage = e.message ?? 'An error occurred.';
      }
    } catch (e) {
      _errorMessage = 'An unexpected error occurred.';
    }

    _isLoading = false;
    notifyListeners();
    return false;
  }
}
