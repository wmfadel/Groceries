import 'package:flutter/material.dart';
import 'package:groceries/src/widgets/cart_details.dart';
import 'package:groceries/src/widgets/cart_tiles.dart';
import 'package:groceries/src/widgets/products_grid.dart';

class HomePage extends StatefulWidget {
  static final String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double screenWidth, screenHeight;
  bool shouldHide = false;
  ScrollController _controller = ScrollController();

  scrollListeners() {
    _controller.addListener(() {
      if (_controller.position.pixels ==
          _controller.position.maxScrollExtent && !shouldHide) {
       setState(() {
         shouldHide = true;
         print('scrollng :$shouldHide!!');
       });
      }
    });

    _controller.addListener(() {
      if (_controller.position.pixels ==
          _controller.position.minScrollExtent && shouldHide) {
       setState(() {
         shouldHide = false;
         print('scrollng :$shouldHide!!');
       });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    scrollListeners();

    return Scaffold(
      backgroundColor: Color(0xff030303),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: ListView(
          controller: _controller,
          children: <Widget>[
            ProductsGrid(),
            SizedBox(height: 10),
            shouldHide ? CartDetails() : CartTiles(),
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
