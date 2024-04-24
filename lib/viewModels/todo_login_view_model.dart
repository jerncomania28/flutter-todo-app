import 'package:flutter/material.dart';

class TodoLoginViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  String? get emailErrorText => _emailErrorText;
  String? get passwordErrorText => _passwordErrorText;

  void updateEmail(String newEmail) {
    _email.text = newEmail;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password.text = newPassword;
    notifyListeners();
  }

  bool validateEmail() {
    if (_email.text.isEmpty) {
      _emailErrorText = 'Email cannot be empty';
      notifyListeners();
      return false;
    } else if (!RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{2,}$')
        .hasMatch(_email.text)) {
      _emailErrorText = 'Enter a valid email address';
      notifyListeners();
      return false;
    } else {
      _emailErrorText = null;
      notifyListeners();
      return true;
    }
  }

  bool validatePassword() {
    if (_password.text.isEmpty) {
      _passwordErrorText = 'Password cannot be empty';
      notifyListeners();
      return false;
    } else if (_password.text.length < 6) {
      _passwordErrorText = 'Password must be at least 6 characters';
      notifyListeners();
      return false;
    } else {
      _passwordErrorText = null;
      notifyListeners();
      return true;
    }
  }

  bool validateCredentials() {
    bool isEmailValid = validateEmail();
    bool isPasswordValid = validatePassword();
    return isEmailValid && isPasswordValid;
  }

  void submit() {
    if (!validateCredentials()) {
      return;
    }

    print('Email: ${_email.text}');
    print('Password: ${_password.text}');
  }
}
