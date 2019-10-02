import 'package:flutter/material.dart';
import 'package:groceries/src/widgets/cart_title.dart';

class CartTiles extends StatelessWidget {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: screenWidth,
      height: 150,
      child: Column(
        children: <Widget>[
          CartTitle(),
        ],
      ),
    );
  }
}
