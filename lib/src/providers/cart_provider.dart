import 'package:flutter/foundation.dart';
import 'package:groceries/src/models/food.dart';

class CartProvider with ChangeNotifier {
  List<Food> _food = [ ];

  List<Food> get food => _food;

  set food(List<Food> value) => _food = value;

  addFood(Food food) {
    bool isNew = true;
    _food.forEach((Food f) {
      if (f.id == food.id) {
        isNew = false;
        return;
      }
    });
    if (isNew) _food.add(food);
    notifyListeners();
  }

  removeFood(food) {
    _food.remove(food);
    notifyListeners();
  }

  double getTotalPrice(){
    double total = 0;
    if(_food != null){
      _food.forEach((f){
        total += f.amount * f.price;
      });
    }
    return total;
  }
}
