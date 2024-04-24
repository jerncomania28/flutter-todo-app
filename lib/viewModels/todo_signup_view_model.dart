import 'package:flutter/material.dart';

class TodoSignUpViewModel extends ChangeNotifier {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;

  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get confirmPassword => _confirmPassword;
  String? get emailErrorText => _emailErrorText;
  String? get passwordErrorText => _passwordErrorText;

  void updateFirstName(String newFirstName) {
    _firstName.text = newFirstName;
    notifyListeners();
  }

  void updateLastName(String newLastName) {
    _lastName.text = newLastName;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password.text = newPassword;
    notifyListeners();
  }

  void updateConfirmPassword(String newConfirmPassword) {
    _confirmPassword.text = newConfirmPassword;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email.text = newEmail;
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
    } else if (_password.text != _confirmPassword.text){
      _passwordErrorText = 'Passwords do not match';
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
    print('First Name: ${_firstName.text}');
    print('Last Name: ${_lastName.text}');
    
  }
}
