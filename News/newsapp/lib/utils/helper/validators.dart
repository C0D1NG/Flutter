extension TextValidators on String {
  bool isValidEmail() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(trim());

  bool isValidPhone() =>
      trim().isNotEmpty && int.parse(trim()).toString().length == 10;

  bool isValidOTP() => trim().length == 4;

  bool isValidName() => trim().isNotEmpty;
}
