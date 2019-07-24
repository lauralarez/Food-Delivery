import 'dart:async';
import 'package:flutter/material.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import '../screens/mainScreen.dart';

class Bloc /*just extends or extends Object*/ with Validators {

  final _email = BehaviorSubject<String>(); //con el _ los marcas como private
  final _password = BehaviorSubject<String>(); //el BehaviorSubject es un StreamController Broadcast con mas funcionalidades
  final _direction = BehaviorSubject<String>();
  final _number = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get direction => _direction.stream.transform(validateDirection);
  Stream<String> get number => _number.stream.transform(validateNumber);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) => true); 
                                //Observable = rxDart Stream

  //retrieve data from stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeDirection => _direction.sink.add;
  Function(String) get changeNumber => _number.sink.add;

  submit(context) {
    //Subject = rxDart StreamController
    final validEmail = _email.value;
    final validPassword = _password.value;
    final validDirection = _direction.value;
    final validNumber = _number.value;
    Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
    //print('Email es $validEmail, la clave $validPassword, direction $validDirection');
  }

  dispose() {
    _email.close();
    _password.close();
    _direction.close();
    _number.close();
  }
}

//final bloc = new Bloc(); single global