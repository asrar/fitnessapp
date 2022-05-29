import 'dart:async';

mixin Myvalidation {
  static bool isEmail(String email) => email.contains('@');

  static bool isFirstName(String firstname) => firstname.isNotEmpty;

  static bool isLastName(String lastname) => lastname.isNotEmpty;

  static bool isPasswordValidLength(String password) => password.length >= 4;

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text $value 1");
      sink.add(value);
    } else {
      print("getting error text $value 2");
      // sink.add("");
      sink.addError("field error");
    }
  });

  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    }
    else {
      sink.addError("Password must be of 4 characters");
    }

  });

  final firstnameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isFirstName(value)) {
      sink.add(value);
    } else {
      sink.addError("First Name Should not Empty");
    }
  });

  final lastNameValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isLastName(value)) {
      sink.add(value);
    } else {
      sink.addError("Last Name Should not Empty");
    }
  });
}
