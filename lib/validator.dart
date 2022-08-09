class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Required Field";
    }

    String pattern =
        r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$';

    RegExp regExp = RegExp(pattern);

    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email id";
    }
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required Field';
    }
    if (password.length <= 7) {
      return 'Please enter minimum 8 characters in password';
    }
  }
}
