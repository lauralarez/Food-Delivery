import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

ItemList fooditemList = ItemList(items: [
  Item(
    id: 1,
    title: "Combo La Mesa Vegetariana",
    hotel: "Cl. 85a #14, Bogota, Colombia",
    price: 17.0,
    imgUrl: Image.asset(
      'images/MesaVegetarianaCombo.jpg',
    ),
  ),
  Item(
    id: 2,
    title: "Combo Euro Snacks",
    hotel: "Cl. 85 #19A-24 Bogota, Colombia",
    price: 8.49,
    imgUrl: Image.asset(
      'images/comidaEuroSnacks.jpg',
    ),
  ),
  Item(
    id: 3,
    title: "Combo Mc'Donalds",
    hotel: "Cl. 80 #24-30, Bogota, Cundinamarca, Colombia",
    price: 12.45,
    imgUrl: Image.asset(
      'images/McDonald-sCombo.jpg',
    ),
  ),
  Item(
    id: 4,
    title: "Combo Il Segreto Della Nonna",
    hotel: "Cl. 13a #78-61, Bogota, Colombia",
    price: 14.49,
    imgUrl: Image.asset(
      'images/ilSegretoDellaNonna.jpg',
    ),
  ),
]);

ItemList hotelitemList = ItemList(items: [
  Item(
    id: 1,
    title: "Viaggio Country Habitacion Sencilla",
    hotel: "Ak. 15 #85-55, Bogota, Colombia",
    price: 8.49,
    imgUrl: Image.asset(
      'images/habitacionSencilla.jpg',
    ),
  ),
  Item(
    id: 2,
    title: "Viaggio Country Habitacion Doble",
    hotel: "Ak. 15 #85-55, Bogota, Colombia",
    price: 12.45,
    imgUrl: Image.asset(
      'images/habitacionDoble.jpg',
    ),
  ),
  Item(
    id: 3,
    title: "Viaggio Country Habitacion Suite",
    hotel: "Ak. 15 #85-55, Bogota, Colombia",
    price: 14.49,
    imgUrl: Image.asset(
      'images/habitacionSuite.jpg',
    ),
  ),
]);

ItemList spaitemList = ItemList(items: [
  Item(
    id: 1,
    title: "Absolut SPA Masaje",
    hotel: "Cra. 16 #85-55, Bogota, Colombia",
    price: 12.45,
    imgUrl: Image.asset(
      'images/masaje.jpg',
    ),
  ),
  Item(
    id: 2,
    title: "Absolut SPA Corte de Cabello",
    hotel: "Cra. 16 #85-55, Bogota, Colombia",
    price: 8.49,
    imgUrl: Image.asset(
      'images/Corte.jpg',
    ),
  ),
]);

ItemList farmaciaitemList = ItemList(items: [
  Item(
    id: 1,
    title: "Tercer Milenio Aspirinas",
    hotel: "Cra. 16 #8066, Bogota, Colombia",
    price: 8.49,
    imgUrl: Image.asset(
      'images/aspirina.jpg',
    ),
  ),
  Item(
    id: 2,
    title: "Tercer Milenio Dentrifico",
    hotel: "Cra. 16 #8066, Bogota, Colombia",
    price: 12.45,
    imgUrl: Image.asset(
      'images/detrifico.jpg',
    ),
  ),
  Item(
    id: 3,
    title: "Farmatodo Dentrifico",
    hotel: "Cra. 16 #82-52, Bogota, Colombia",
    price: 10.95,
    imgUrl: Image.asset(
      'images/detrifico.jpg',
    ),
  ),
  Item(
    id: 4,
    title: "Tercer Milenio Jabon",
    hotel: "Cra. 16 #8066, Bogota, Colombia",
    price: 14.49,
    imgUrl: Image.asset(
      'images/jabon.jpg',
    ),
  ),
]);

ItemList licoreriaitemList = ItemList(items: [
  Item(
    id: 1,
    title: "La Licorera Cerveza Kirin",
    hotel: "Cra. 30-85 #22-53, Bogota, Colombia",
    price: 5.45,
    imgUrl: Image.asset(
      'images/prd-cerveza-japonesa-kirin-japonshop.jpg',
    ),
  ),
  Item(
    id: 2,
    title: "La Licorera Whysky",
    hotel: "Cra. 30-85 #22-53, Bogota, Colombia",
    price: 14.49,
    imgUrl: Image.asset(
      'images/whysky.jpg',
    ),
  ),
  Item(
    id: 3,
    title: "La Licorera Ron",
    hotel: "Cra. 30-85 #22-53, Bogota, Colombia",
    price: 18.49,
    imgUrl: Image.asset(
      'images/ron.jpg',
    ),
  ),
]);

class ItemList {
  List<Item> items;

  ItemList({@required this.items});
}

class Item {
  int id;
  String title;
  String hotel;
  double price;
  Image imgUrl;
  int quantity;

  Item({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
