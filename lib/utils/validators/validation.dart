class MyValidator {
  //empty text validation
  static String? validationEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  //mail
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is required.";
    }

    final emailRegularExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegularExp.hasMatch(value)) {
      return "Invalid email address.";
    }

    return null;
  }

  //password
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is required.";
    }

    //check length
    if (value.length < 6) {
      return "Password must be at least 6 charaters.";
    }

    //check uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one Uppercase letter.";
    }

    //check number
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one number.";
    }

    //check special character
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character.";
    }

    return null;
  }

  static String? validatePhoneno(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is required.";
    }

    // final phonenoRegExp = RegExp(r'\d{9}^$');
    final phonenoRegExp = RegExp(r'^[\+]?[0-9]{7,12}$');

    if (!phonenoRegExp.hasMatch(value)) {
      return "Invalid phone number format(9 digits required)";
    }

    return null;
  }
}
