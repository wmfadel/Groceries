import 'package:flutter/foundation.dart';
import 'package:groceries/src/models/food.dart';
import 'package:provider/provider.dart';

class FoodProvider with ChangeNotifier {
  List<Food> _food = getFood();

  List<Food> get food => _food;
  set food(List<Food> value) =>_food = value;



}

getFood(){
  return [
    Food(
        id: 0,
        image: 'assets/pics/food0.png',
        price: 14.99,
        weight: 900,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 1,
        image: 'assets/pics/food1.png',
        price: 8.99,
        weight: 500,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 2,
        image: 'assets/pics/food2.png',
        price: 14.00,
        weight: 500,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 3,
        image: 'assets/pics/food3.png',
        price: 12.99,
        weight: 350,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 4,
        image: 'assets/pics/food4.png',
        price: 4.99,
        weight: 400,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 5,
        image: 'assets/pics/food5.png',
        price: 6.99,
        weight: 500,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 6,
        image: 'assets/pics/food6.png',
        price: 17.99,
        weight: 670,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 7,
        image: 'assets/pics/food7.png',
        price: 28.99,
        weight: 100,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 8,
        image: 'assets/pics/food8.png',
        price: 65.99,
        weight: 300,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 9,
        image: 'assets/pics/food9.png',
        price: 47.99,
        weight: 800,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 10,
        image: 'assets/pics/food10.png',
        price: 5.99,
        weight: 450,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 11,
        image: 'assets/pics/food11.png',
        price: 57.99,
        weight: 650,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 12,
        image: 'assets/pics/food12.png',
        price: 68.99,
        weight: 600,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 13,
        image: 'assets/pics/food13.png',
        price: 74.99,
        weight: 750,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 14,
        image: 'assets/pics/food14.png',
        price: 55.99,
        weight: 700,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
    Food(
        id: 15,
        image: 'assets/pics/food15.png',
        price: 32.99,
        weight: 800,
        description: 'Lorem Ipsum is simply dummy text of the printing'),
  ];
}