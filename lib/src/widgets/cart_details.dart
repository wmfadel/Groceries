import 'package:flutter/material.dart';
import 'package:groceries/src/providers/cart_provider.dart';
import 'package:groceries/src/widgets/cart_item.dart';
import 'package:provider/provider.dart';

class CartDetails extends StatelessWidget {
  double screenWidth, screenHeight;
  CartProvider _provider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    _provider = Provider.of<CartProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),

      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 40, bottom: 40),
            child: Text(
              'Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
          ),
          ..._provider.food.map((f) => CartItem(f)).toList(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: screenWidth,
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.amber[600],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Delivery',
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
                Text('\$30',
                    style: TextStyle(color: Colors.white, fontSize: 16)),

              ],
            ),

          ),
          SizedBox(height: 50),
          Container(
            width: screenWidth,
            padding: EdgeInsets.only(left: 10,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text('Total',style: TextStyle(color: Colors.grey.withOpacity(0.6),fontWeight: FontWeight.bold,fontSize: 25),),
                Text('\$${(_provider.getTotalPrice()+30).toStringAsFixed(2)}',style:TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35))
              ],
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: MaterialButton(
              onPressed: () {

              },
              color: Colors.amber[600],
              elevation: 0,
              child: Text(
                'Next',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              height: 50,
              minWidth: screenWidth - 100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }


}
