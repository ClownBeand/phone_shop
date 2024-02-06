import "package:electronics/models/Mobile.dart";
import "package:flutter/material.dart";

class Shop extends ChangeNotifier {
  final List<Mobile> _mobileList = [
    Mobile(
      imagePath: "assets/images/Mobile/s10-white.png",
      name: "Samsung S10",
      storage: "128",
      ram: "6",
      size: "5.9",
      price: "240",
      colors: "white",
      camera: " ",
      cpu: "Snapdragon 810",
      rating: "4.1",
    ),
    Mobile(
      imagePath: "assets/images/Mobile/iphone-13-Pro-Silver.png",
      name: "iphone 13 Pro",
      storage: "128",
      ram: "8",
      size: "6.5",
      price: "750",
      colors: "white",
      camera: " ",
      cpu: "M11",
      rating: "4.1",
    ),
    Mobile(
      imagePath: "assets/images/Mobile/samsung-galaxy-s23-plus-white.png",
      name: "Samsung S23",
      storage: "256",
      ram: "8",
      size: "6.5",
      price: "399",
      colors: "white",
      camera: " ",
      cpu: "Snapdragon 810",
      rating: "4.1",
    ),
  ];

  //customer cart
  final List<Mobile> _cart = [];

  //getter methods
  List<Mobile> get mobileList => _mobileList;
  List<Mobile> get cart => _cart;

  //add to cart
  void addToCart(Mobile mobileItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(mobileItem);
    }
    notifyListeners();
  }

  void removeToCart(Mobile mobile) {
    _cart.remove(mobile);
    notifyListeners();
  }
}
