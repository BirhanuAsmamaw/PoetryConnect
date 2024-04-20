mixin class ValidationMixin {
  final RegExp emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z]+\.[a-zA-Z]+");

  String? emailValidation(String? value) {
    if (!emailValid.hasMatch(value!)) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? usernameValidation(String? value) {
    if (value!.length < 5) {
      return 'please enter a valid username';
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value!.length < 8) {
      return 'please increase password security';
    }
    return null;
  }

  String? titleValidation(String? value) {
    if (value!.length < 10) {
      return 'please expressive title!';
    }
    return null;
  }

  String? authorValidation(String? value) {
    if (value!.isEmpty) {
      return 'please author Name !';
    }
    return null;
  }

  String? peomValidation(String? value) {
    if (value!.length < 20) {
      return 'please make the poem understandable';
    }
    return null;
  }

  String? roleValidation(String? value) {
    if (value! != 'poet' && value != 'enthusiast') {
      return 'please tell us about yourself';
    }
    return null;
  }

  String? genreValidation(String? value) {
    if (value! != 'narrative' && value != 'dramatic' && value != 'lyric') {
      return 'choose from the hinted genres';
    }
    return null;
  }
}
