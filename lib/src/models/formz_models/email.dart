import 'package:formz/formz.dart';

import '../../config/constants_error.dart';



enum EmailError { invalid, empty, exist, duplicate }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$',
  );

  @override
  EmailError? validator(String value) {
    // TODO
    if (value == 'emailDuplicate') {
      return EmailError.duplicate;
    }
    if (value.isEmpty) {
      return EmailError.empty;
    }
    return _emailRegExp.hasMatch(value) ? null : EmailError.invalid;
  }
}

extension EmailExplanation on EmailError {
  String? get name {
    switch (this) {
      case EmailError.empty:
        return ConstantsError.emailEmpty;
      case EmailError.invalid:
        return ConstantsError.emailInvalid;
      case EmailError.exist:
        return ConstantsError.emailExists;
      case EmailError.duplicate:
        return ConstantsError.nullValue;
      default:
        return null;
    }
  }
}
