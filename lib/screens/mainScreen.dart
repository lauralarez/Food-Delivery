import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/listTileColorBloc.dart';
import 'package:food_delivery/model/itemsModel.dart';
import 'package:food_delivery/screens/spaScreen.dart';
import 'package:food_delivery/screens/userDataScreen.dart';
import '../bloc/cartlistBloc.dart';
import 'cartScreen.dart';
import 'farmaciaScreen.dart';
import 'hotelScreen.dart';
import 'licoreriaScreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        //BLoCs
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      child: MaterialApp(
        title: "Comida a domicilio",
        home: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
        color: Colors.transparent,
        child: ListView(
          children: <Widget>[
            title("Restaurantes", "cercanos"),
            //Cabecera, opcion de busqueda y lista de productos disponibles
            FirstHalf(catName: "Comida"),
            SizedBox(height: 45),
            //Se retorna la lista con todos los productos
            for (var foodItem in fooditemList.items)
              Builder(
                builder: (context) {
                  return ItemContainer(item: foodItem);
                },
              )
          ],
        ),
      )),
    );
  }
}

buildCart() {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  return StreamBuilder(
    stream: bloc.listStream,
    builder: (context, snapshot) {
      List<Item> foodItems = snapshot.data;
      int length = foodItems != null ? foodItems.length : 0;

      return buildGestureDetector(length, context);
    },
  );
}

GestureDetector buildGestureDetector(int length, BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (length > 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
      } else {
        return;
      }
    },
    child: Container(
      //padding: EdgeInsets.all(15),
      child: Image.asset(
        'images/shopping-cart-02.png',
        width: 50,
        height: 70,
        fit: BoxFit.cover,
      ),
      /*Icon(
        Icons.restaurant_menu,
        size: 35,
        color: Colors.black,
      ),*/
      /* Row(
        children: <Widget>[
          Icon(Icons.restaurant_menu),
          Text(length.toString()),
        ],
      ),*/
      //padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          //color: Colors.teal[50], borderRadius: BorderRadius.circular(90),
          ),
    ),
  );
}

header(context) {
  return new ListView(
    children: <Widget>[
      new UserAccountsDrawerHeader(
        accountName: new Text("Laura"),
        accountEmail: new Text("laularez@"),
        currentAccountPicture: new GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => UserDataScreen()));
          },
          child: new CircleAvatar(
            backgroundColor: Color(0xFF0A4FAC),
          ),
        ),
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new NetworkImage("url"),
          fit: BoxFit.fill,
        )),
      ),
      new ListTile(
        title: new Text("Restaurantes"),
        trailing: new Icon(Icons.restaurant),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => MainScreen()));
        },
      ),
      new ListTile(
        title: new Text("Hoteles"),
        trailing: new Icon(Icons.hotel),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => HotelScreen()));
        },
      ),
      new ListTile(
        title: new Text("SPAs"),
        trailing: new Icon(Icons.hot_tub),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (context) => SpaScreen()));
        },
      ),
      /*new ListTile(
        title: new Text("Abarrotes"),
        trailing: new Icon(Icons.texture),
      ),*/
      new ListTile(
        title: new Text("Farmacias"),
        trailing: new Icon(Icons.shopping_basket),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => FarmaciaScreen()));
        },
      ),
      new ListTile(
        title: new Text("Licorerias"),
        trailing: new Icon(Icons.local_bar),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              new MaterialPageRoute(builder: (context) => LicoreriaScreen()));
        },
      ),
      /*new ListTile(
        title: new Text("Lavanderia"),
        trailing: new Icon(Icons.local_laundry_service),
      ),*/
    ],
  );
}

Widget title(String titulo, String subtitulo) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 35, 10, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
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
            Text(
              subtitulo,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 35,
                color: Color(0xFF33D9D6),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({
    Key key,
    @required this.catName,
  }) : super(key: key);

  final String catName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
      child: Column(
        children: <Widget>[
          //CustomAppBar(),
          //tambien se puede usar spacer widget
          //SizedBox(height: 30),
          //title(),
          //SizedBox(height: 30),
          //searchBar(),
          SizedBox(height: 5),
          categories(context, catName),
        ],
      ),
    );
  }
}

Widget categories(context, catName) {
  return Container(
    height: 185,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => MainScreen()));
          },
          child: CategoryListItem(
            categoryIcon: Icons.restaurant,
            categoryName: "Restaurant",
            availability: 6,
            selected: catName == "Comida" ? true : false,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => HotelScreen()));
          },
          child: CategoryListItem(
            categoryIcon: Icons.hotel,
            categoryName: "Hotel",
            availability: 0,
            selected: catName == "Hotel" ? true : false,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (context) => SpaScreen()));
          },
          child: CategoryListItem(
            categoryIcon: Icons.hot_tub,
            categoryName: "SPA",
            availability: 0,
            selected: catName == "SPA" ? true : false,
          ),
        ),
        /*CategoryListItem(
          categoryIcon: Icons.texture,
          categoryName: "Abarrotes",
          availability: 0,
          selected: catName == "Abarrotes" ? true : false,
        ),*/
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => FarmaciaScreen()));
          },
          child: CategoryListItem(
            categoryIcon: Icons.shopping_basket,
            categoryName: "Farmacia",
            availability: 0,
            selected: catName == "Farmacia" ? true : false,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => LicoreriaScreen()));
          },
          child: CategoryListItem(
            categoryIcon: Icons.local_bar,
            categoryName: "Licoreria",
            availability: 0,
            selected: catName == "Licoreria" ? true : false,
          ),
        ),

        /*CategoryListItem(
          categoryIcon: Icons.local_laundry_service,
          categoryName: "Lavanderia",
          availability: 0,
          selected: catName == "Lavanderia" ? true : false,
        ),*/
      ],
    ),
  );
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    Key key,
    @required this.categoryIcon,
    @required this.categoryName,
    @required this.availability,
    @required this.selected,
  }) : super(key: key);

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: selected ? Color(0xFF33D9D6) : Colors.white,
          border: Border.all(
              color: selected ? Colors.transparent : Colors.grey[200],
              width: 1.5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[100],
              blurRadius: 15,
              offset: Offset(15, 0),
              spreadRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                      color: selected ? Colors.transparent : Colors.grey[200],
                      width: 1.5)),
              child: Icon(
                categoryIcon,
                color: Colors.black,
                size: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              categoryName,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 15),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 6, 0, 10),
              width: 1.5,
              height: 15,
              color: Colors.black26,
            ),
            Text(
              availability.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.black45,
      ),
      SizedBox(width: 20),
      Expanded(
        child: TextField(
          decoration: InputDecoration(
              hintText: "Buscar....",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
      ),
    ],
  );
}

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              List<Item> foodItems = snapshot.data;
              int length = foodItems != null ? foodItems.length : 0;

              return buildGestureDetector(length, context, foodItems);
            },
          )
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<Item> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else {
          return;
        }
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Text(length.toString()),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer({
    @required this.item,
    //@required this.catItem,
  });

  final Item item;
  //final String catItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(Item foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(Item foodItem) {
    bloc.removeFromList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(item);
        final snackBar = SnackBar(
          content: Text('${item.title} agregado al carrito'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        hotel: item.hotel,
        itemName: item.title,
        itemPrice: item.price,
        imgUrl: item.imgUrl,
        leftAligned: (item.id % 2) == 0 ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  Items({
    @required this.leftAligned,
    @required this.imgUrl,
    @required this.itemName,
    @required this.itemPrice,
    @required this.hotel,
  });

  final bool leftAligned;
  final Image imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: imgUrl,
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(
                    left: leftAligned ? 20 : 0,
                    right: leftAligned ? 0 : 20,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )),
                            ),
                            Text("\$$itemPrice",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                )),
                          ],
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 15),
                                children: [
                                  //TextSpan(text: "por "),
                                  TextSpan(
                                      text: hotel,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700))
                                ]),
                          ),
                        ),
                        SizedBox(height: containerPadding),
                      ])),
            ],
          ),
        )
      ],
    );
  }
}
