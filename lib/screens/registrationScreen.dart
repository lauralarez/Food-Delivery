import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/loginBloc.dart';
import 'mainScreen.dart';

class RegistrationScreen extends StatelessWidget {
  final bloc = new Bloc();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xffe3d5b6),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: title("Datos de Usuario"),
              ),
              nameField(bloc),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              emailField(bloc),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              numberField(bloc),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc, context),
            ],
          ),
        ));
  }

  Widget title(String titulo) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                titulo,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFF0A4FAC),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget nameField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            decoration: InputDecoration(
              hintText: 'Nombre',
              labelText: 'Nombre',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@ex.com',
              labelText: 'Correo',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget numberField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: '0000-0000000',
              labelText: 'Numero de Telefono',
              errorText: snapshot.error,
            ),
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
              'ACEPTAR',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ),
          color: Color(0xffe3d5b6),
          onPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            
          }
          //=> snapshot.hasData ? bloc.submit(context) : null,
          //snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
