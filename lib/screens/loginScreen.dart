import 'package:flutter/material.dart';
import '../bloc/loginBloc.dart';
import '../bloc/provider.dart';
import 'mainScreen.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
        margin: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              Image.asset(
                'images/logo_spondylux_vertical.png',
                width: 600,
                height: 340,
                fit: BoxFit.cover,
              ),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              emailField(bloc),
              passwordField(bloc),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc, context),
            ],
          ),
        ));
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@ex.com',
            labelText: 'Correo',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Clave',
            labelText: 'Clave',
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  Widget submitButton(Bloc bloc, context) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: Text(
                'INGRESAR',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
            color: Color(0xffe3d5b6),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            }
            //snapshot.hasData ? bloc.submit : null,

            );
      },
    );
  }

  prueba(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
  /*validSubmit(Bloc bloc, BuildContext context) {
    bloc.submit();
    /*final snackBar = SnackBar(
          content: Text('Campos validados'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);*/
  }*/
}
