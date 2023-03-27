import 'package:flutter/material.dart';

class BooksProvider with ChangeNotifier{
  List cartList = [];
  double total = 0;

  List<Map<String, dynamic>> books = [
    {
      'name': 'Harry Potter',
      'price': 800.0,
      'imageUrl': 'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/81S0LnPGGUL.jpg',
    },
    {
      'name': 'Fire & Ice',
      'price': 550.0,
      'imageUrl': 'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/71Gvh1WhiCL.jpg',
    },
    {
      'name': 'Rich Dad, Poor Dad',
      'price': 200.0,
      'imageUrl': 'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/51Hfv2MfNGL._SX331_BO1,204,203,200_.jpg',
    },
    {
      'name': 'Energize Your Mind',
      'price': 170.0,
      'imageUrl': 'https://m.media-amazon.com/images/I/71B4h-dSVzL._AC_UY218_.jpg',
    },
    {
      'name': 'The Subtle Art of Not Giving a F*ck',
      'price': 170.0,
      'imageUrl': 'https://m.media-amazon.com/images/I/71QKQ9mwV7L._AC_UY218_.jpg',
    },
    {
      'name': 'KARMA',
      'price': 200.0,
      'imageUrl': 'https://m.media-amazon.com/images/I/51ewXeUdkvL._SX312_BO1,204,203,200_.jpg',
    },
    {
      'name': 'Mind is your Business',
      'price': 200.0,
      'imageUrl': 'https://m.media-amazon.com/images/I/51ID3mbjTkL._SY487_BO1,204,203,200_.jpg',
    },
  ];



  addToList(index){
    cartList.add(index);
    total += books[index]['price'];
    notifyListeners();
  }

  removeFromList(index){
    cartList.remove(index);
    total -= books[index]['price'];
    notifyListeners();
  }
}