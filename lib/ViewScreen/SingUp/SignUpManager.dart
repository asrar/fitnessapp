// class SignUpManager {

import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/LogIn/UserService.dart';
import 'package:fitnessapp/ViewScreen/SingUp/SignUpService.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'Myvalidation.dart';

//import '../../../Test.dart';

class SignUpManager with Myvalidation {
  final _password = BehaviorSubject<String>();
  final _auth = BehaviorSubject<String>();

  final _email = BehaviorSubject<String>();

  Stream<String> get email$ => _email.stream.transform(validateEmail);

  Sink<String> get inEmail => _email.sink;

  final _firstName = BehaviorSubject<String>();

  Stream<String> get firstName$ =>
      _firstName.stream.transform(firstnameValidation);

  Sink<String> get infirstName => _firstName.sink;

  final _lastName = BehaviorSubject<String>();

  Stream<String> get lastName$ =>
      _lastName.stream.transform(lastNameValidation);

  Sink<String> get inlastName => _lastName.sink;

  Stream<String> get password$ => _password.stream.transform(passwordLength);

  Sink<String> get inPassword => _password.sink;

  Stream<bool> get isFormSubmit$ async* {
    CombineLatestStream(
        [email$, password$, firstName$, lastName$], (values) => true);
    print("inside isUserAUTH  1 ");
    if (_email.value != null && _password.value != null) {
      //UserProfileManager manager_user = new UserProfileManager();
      String query =
          "email=${_email.value}&password=${_password.value}&first_name=${_firstName.value}&last_name=${_lastName.value}&gender=male&register_via=custom&apple_id=123";

      print('query is this from new stream ${query}');

      yield await SingUpService.browse(query);
    }
  }

  Stream<bool> get isFormValid$ => CombineLatestStream(
      [email$, password$, firstName$, lastName$], (values) => true);

  Stream<String> get login_status$ async* {
    yield await Overseer.login_status;
  }

  Stream<bool> get isUserAuth$ async* {
    print("inside isUserAUTH  ");
    //UserProfileManager manager_user = new UserProfileManager();
    String query = "email=${_email.value}&password=${_password.value}";

    print('query is this ${query}');
  }
}
