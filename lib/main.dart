import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/loginScreen.dart';
import 'bloc/provider.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(App());
} 

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Iniciar Sesion',
        home: Scaffold(
          body: LoginScreen(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
