import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  // data - state
  List<String> cart = [];

  // operations

  void addItem(String item){
    cart.add(item);
    notifyListeners();
  }

  void removeItem(String item){
    cart.remove(item);
    notifyListeners();
  }
  
}