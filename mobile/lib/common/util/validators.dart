final _email = RegExp(
  r'''^(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''',
);

String? emailValidator(String? text) {
  if (text?.isEmpty ?? true) {
    return 'Field required';
  }

  final diagnosticMessages = <String>[];
  if (!_email.hasMatch(text!.toLowerCase())) {
    diagnosticMessages.add('Not a valid email address format');
  }

  if (diagnosticMessages.isEmpty) {
    return null;
  }
  return diagnosticMessages.join('\n');
}

String? requiredFieldValidator<T>(T? value) {
  if (value == null || (value is String && value.isEmpty)) {
    return 'Field required';
  }

  return null;
}
