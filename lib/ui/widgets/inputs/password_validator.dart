import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

enum PasswordValidationError {
  isEmpty,
  mustIncludeUpperAndLowerCase,
  mustIncludeADigit,
  insuficientLength,
}

class PasswordValidator extends FormzInput<String, PasswordValidationError>
    with EquatableMixin {
  final bool isRequired;
  final bool validateFormat;
  //TODO: Fix const constructor

  PasswordValidator.pure({this.isRequired = false, this.validateFormat = false})
      : super.pure('');

  PasswordValidator.dirty(
      {this.isRequired = false,
      this.validateFormat = false,
      required String value})
      : super.dirty(value);

  static const Map<PasswordValidationError, String> errorsMessagesMap = {
    PasswordValidationError.isEmpty: 'Enter a password',
    PasswordValidationError.mustIncludeUpperAndLowerCase:
        'Must include both upper and lower case letters',
    PasswordValidationError.mustIncludeADigit:
        'Must include at least one number',
    PasswordValidationError.insuficientLength:
        'Must be at least 6 characters long',
  };

  static final RegExp mustIncludeUpperAndLowerCase = RegExp(
    r'(?=.*[A-Z])(?=.*[a-z])',
  );

  static final RegExp mustIncludeADigit = RegExp(
    r'(?=.*\d)',
  );

  @override
  List<Object> get props => [value, isRequired, validateFormat];

  bool isLengthValid(value) {
    return value.length >= 6;
  }

  bool isUpperAndLowerCaseValid(value) {
    return mustIncludeUpperAndLowerCase.hasMatch(value);
  }

  bool isMustIncludeADigitValid(value) {
    return mustIncludeADigit.hasMatch(value);
  }

  PasswordValidator copyWithDirty(
      {String? value, bool? isRequired, bool? validateFormat}) {
    return PasswordValidator.dirty(
      value: value ?? this.value,
      isRequired: isRequired ?? this.isRequired,
      validateFormat: validateFormat ?? this.validateFormat,
    );
  }

  @override
  PasswordValidationError? validator(String value) {
    if (isRequired && (value == null || value.length == 0)) {
      return PasswordValidationError.isEmpty;
    }

    if (!validateFormat) {
      return null;
    }

    if (!isLengthValid(value)) {
      return PasswordValidationError.insuficientLength;
    }

    if (!isUpperAndLowerCaseValid(value)) {
      return PasswordValidationError.mustIncludeUpperAndLowerCase;
    }

    if (!isMustIncludeADigitValid(value)) {
      return PasswordValidationError.mustIncludeADigit;
    }

    return null;
  }
}
