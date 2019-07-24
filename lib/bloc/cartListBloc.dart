import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:food_delivery/bloc/provider.dart';
import 'package:food_delivery/model/itemsModel.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {

  CartListBloc();

///////////////////////FOOD//////////////////////////////////
  //recibe un num y cambia la cuenta
  var _listControllerFood = BehaviorSubject<List<Item>>.seeded([]);
  CartProvider provider = CartProvider();
  //output
  Stream<List<Item>> get listStream => _listControllerFood.stream;
  //input
  Sink<List<Item>> get listSinkFood => _listControllerFood.sink;

  addToList (Item foodItem) {
    listSinkFood.add(provider.addToListFood(foodItem));
  }

  removeFromList (Item foodItem) {
    listSinkFood.add(provider.removeFromListFood(foodItem));
  }

  void dispose() {
    _listControllerFood.close();
    super.dispose();
  }
}
