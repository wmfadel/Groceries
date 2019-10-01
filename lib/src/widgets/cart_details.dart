import 'package:flutter/material.dart';

class CartDetails extends StatelessWidget {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      width: screenWidth,
      height: 600,
    );
  }
}
