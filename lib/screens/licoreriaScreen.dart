import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/model/itemsModel.dart';
import 'mainScreen.dart';

class LicoreriaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
        child: header(context),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            buildCart(),
          ],
        ),
        leading: new IconButton(
            icon: new Icon(
              Icons.menu,
              size: 35,
              color: Color(0xffe3d5b6),
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
      ),
      
      body: SafeArea(
          child: Container(
        child: ListView(
          children: <Widget>[
            //Cabecera, opcion de busqueda y lista de productos disponibles
            title("Licoreras", "cercanas"),
            FirstHalf(catName : "Licoreria"),
            SizedBox(height: 45),
            //Se retorna la lista con todos los productos
            for (var licoreraItem in licoreriaitemList.items)
              Builder(
                builder: (context) {
                  return ItemContainer(item: licoreraItem);
                },
              )
          ],
        ),
      )),
    );
  }
}
