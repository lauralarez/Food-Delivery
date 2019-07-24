import 'dart:async';
import 'package:flutter/material.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import '../screens/mainScreen.dart';

class Bloc /*just extends or extends Object*/ with Validators {

  final _email = BehaviorSubject<String>(); //con el _ los marcas como private
  final _password = BehaviorSubject<String>(); //el BehaviorSubject es un StreamController Broadcast con mas funcionalidades

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true); 
                                //Observable = rxDart Stream

  //retrieve data from stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    //Subject = rxDart StreamController
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email es $validEmail y la clave $validPassword');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}

//final bloc = new Bloc(); single global