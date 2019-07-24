import 'package:flutter/material.dart';
import 'package:food_delivery/model/itemsModel.dart';
import 'loginBloc.dart';

class Provider extends InheritedWidget {
  final bloc = new Bloc();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}

class CartProvider {
  ///////////////////////FOOD//////////////////////////////////
  //couterProvider only consists of a counter and a method which is responsible for increasing the value of count
  List<Item> foodItems = [];

  List<Item> addToListFood(Item foodItem) {
    bool isPresent = false;

    if (foodItems.length > 0) {
      for (int i = 0; i < foodItems.length; i++) {
        if (foodItems[i].id == foodItem.id) {
          increaseItemQuantityFood(foodItem);
          isPresent = true;
          break;
        } else {
          isPresent = false;
        }
      }
      if (!isPresent) {
        foodItems.add(foodItem);
      }
    } else {
      foodItems.add(foodItem);
    }

    return foodItems;
  }

  List<Item> removeFromListFood(Item foodItem) {
    if (foodItem.quantity > 1) {
      //only decrease the quantity
      decreaseItemQuantityFood(foodItem);
    } else {
      //remove it from the list
      foodItems.remove(foodItem);
    }
    return foodItems;
  }

  void increaseItemQuantityFood(Item foodItem) => foodItem.incrementQuantity();
  void decreaseItemQuantityFood(Item foodItem) => foodItem.decrementQuantity();
}

