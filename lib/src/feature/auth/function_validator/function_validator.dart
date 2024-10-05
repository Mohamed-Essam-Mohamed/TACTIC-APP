String? functionUserNameValidator(text) {
  if (text!.trim().isEmpty) {
    return "Please enter your name";
  }

  if (text.length < 3) {
    return "not valid name, you should be at greater 3 characters";
  }
  //? regular expression name
  RegExp regex = RegExp(r'^[a-zA-Z\s]+$');
  if (!regex.hasMatch(text)) {
    return "your name is not valid";
  }
  return null;
}

String? functionEmailValidator(text) {
  if (text!.trim().isEmpty) {
    return "Please enter your email";
  }
  //? regular expression email
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (!regex.hasMatch(text)) {
    return "your email is not valid";
  }
  return null;
}

String? functionPasswordValidator(text) {
  if (text!.trim().isEmpty) {
    return "Please enter your password";
  }
  if (text.length <= 8) {
    return "your password is short";
  }

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (!regex.hasMatch(text)) {
    return "your password is not valid";
  }
  return null;
}
