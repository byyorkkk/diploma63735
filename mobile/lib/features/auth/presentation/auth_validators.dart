final _upperCase = RegExp('^(?=.*[A-Z])');
final _lowerCase = RegExp('^(?=.*[a-z])');
final _number = RegExp('^(?=.*[0-9])');
final _specialCharacters =
    RegExp(r'''^(?=.*?[\^$*.[\]{}()?"!@#%&/\\,><':;|_~`=+\- ])''');

String? passwordValidator(String? passwordText) {
  const minLength = 8;
  final diagnosticMessages = <String>[];

  if (passwordText == null) {
    return null;
  }
  if (passwordText.length < minLength) {
    diagnosticMessages.add(
      'The password must be $minLength characters or more',
    );
  }
  if (!_upperCase.hasMatch(passwordText)) {
    diagnosticMessages.add('Requires 1 upper case character');
  }
  if (!_lowerCase.hasMatch(passwordText)) {
    diagnosticMessages.add('Requires 1 lower case character');
  }
  if (!_number.hasMatch(passwordText)) {
    diagnosticMessages.add('Requires 1 number');
  }
  if (!_specialCharacters.hasMatch(passwordText)) {
    diagnosticMessages.add('Requires 1 special character');
  }
  if (diagnosticMessages.isEmpty) {
    return null;
  }

  return diagnosticMessages.join('\n');
}

String? retypePasswordValidator(
  String? retypePasswordText,
  String? passwordText,
) {
  if (retypePasswordText != passwordText) {
    return 'Passwords must match';
  }
  return null;
}
