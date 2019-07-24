import 'dart:async';

class Validators {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.contains('@') && email.contains('@') && email.length > 10) {
        sink.add(email); 
      }
      else {
        sink.addError('El correo ingresado es invalido');
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.length > 5) {
        sink.add(password);
      }
      else {
        sink.addError('La clave debe ser mayor a seis caracteres');
      }
    }
  );

  final validateDirection = StreamTransformer<String, String>.fromHandlers(
    handleData: (direction, sink) {
      if (direction.length > 15) {
        sink.add(direction);
      }
      else {
        sink.addError('La direccion debe ser mayor a quince caracteres');
      }
    }
  );

  final validateNumber = StreamTransformer<String, String>.fromHandlers(
    handleData: (number, sink) {
      if (number.length > 1) {
        sink.add(number);
      }
      else {
        sink.addError('Invalido');
      }
    }
  );
}