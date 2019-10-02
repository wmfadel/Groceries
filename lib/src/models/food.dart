import 'package:flutter/foundation.dart';

class Food {
  int id;
  String image;
  double price;
  double weight;
  String description;
  int amount = 0;

  Food({
    @required this.id,
    @required this.image,
    @required this.price,
    @required this.weight,
    @required this.description,
  });
}
