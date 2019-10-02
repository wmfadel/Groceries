import 'package:flutter/material.dart';
import 'package:groceries/src/models/food.dart';

class CartItem extends StatelessWidget {
  double screenWidth, screenHeight;
  Food _food;

  CartItem(this._food);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      width: screenWidth,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(_food.image),
          ),
          Text('${_food.amount}',
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text('x', style: TextStyle(color: Colors.white, fontSize: 16)),
          Container(
            width: screenWidth * 0.5,
            child: Text('${_food.description}',
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          Text('\$${(_food.amount * _food.price).toStringAsFixed(2)}',
              style: TextStyle(color: Colors.white, fontSize: 16)),

        ],
      ),
    );
  }
}
