import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/loginBloc.dart';
import 'mainScreen.dart';

class UserDataScreen extends StatelessWidget {
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
              Container(
                child: title("Datos de Pedidos"),
              ),
              directionField(bloc),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              cardNumberField(bloc),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: expDateField(bloc),
                  ),
                  new Flexible(
                    child: cVVField(bloc),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Flexible(
                    child: nameCardField(bloc),
                  ),
                  new Flexible(
                    child: lastNameCardField(bloc),
                  ),
                ],
              ),              
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
              submitButton(bloc, context),
              Container(
                margin: EdgeInsets.only(top: 25.0),
              ),
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

  Widget directionField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.direction,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeDirection,
            decoration: InputDecoration(
              hintText: 'Bogota, Colombia',
              labelText: 'Direccion',
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

  Widget cardNumberField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'XXXX XXXX XXXX XXXX',
              labelText: 'Numero de Tarjeta',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget expDateField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'MM/YY',
              labelText: 'Fecha de Expiracion',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget cVVField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'CVV',
              labelText: 'CVV',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget nameCardField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            decoration: InputDecoration(
              hintText: 'Nombre (Correspondiente a la tarjeta)',
              labelText: 'Nombre',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }

  Widget lastNameCardField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.number,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            onChanged: bloc.changeNumber,
            decoration: InputDecoration(
              hintText: 'Apellido (Correspondiente a la tarjeta)',
              labelText: 'Apellido',
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
          onPressed: () => snapshot.hasData ? bloc.submit(context) : null,
          //snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
