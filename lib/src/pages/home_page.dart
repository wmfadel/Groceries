import 'package:flutter/material.dart';
import 'package:groceries/src/widgets/cart_details.dart';
import 'package:groceries/src/widgets/products_grid.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Scaffold(
      backgroundColor: Color(0xff030303),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: ListView(
          children: <Widget>[
            ProductsGrid(),
            SizedBox(height: 20),
            CartDetails(),
          ],
        ),
      ),
    );
  }
}
/*
ECE9DE light
CBC3AF darkish
 */
