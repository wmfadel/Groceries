import 'package:flutter/material.dart';
import 'package:groceries/src/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartTitle extends StatelessWidget {
  double screenWidth, screenHeight;
  CartProvider _provider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    _provider = Provider.of<CartProvider>(context);
    return Container(
      height: 80,
      child: Row(children: <Widget>[
        Text(
          'Cart',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          width: screenWidth - 170,
          height: 55,
          child: ListView.builder(
            itemCount: _provider.food.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(_provider.food[index].image),
                ),
              );
            },
          ),
        ),
        SizedBox(width: 10),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber[600],
          ),
          child: CircleAvatar(
            child: Text(
              '${_provider.food.length}',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.amber[600],
          ),
        ),
      ]),
    );
  }
}
