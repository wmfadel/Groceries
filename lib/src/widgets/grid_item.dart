import 'package:flutter/material.dart';
import 'package:groceries/src/models/food.dart';
import 'package:groceries/src/pages/product_details.dart';

class GridItem extends StatelessWidget {
  Food _food;

  GridItem(this._food);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(ProductDetails.routeName,
          arguments: <String, dynamic>{'id': _food.id}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
              child: Hero(
                  tag: '${_food.id}',
                  child: Image.asset(_food.image,
                      height: 125, fit: BoxFit.contain))),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text('\$${_food.price}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              _food.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text('${_food.weight}g'),
          )
        ],
      ),
    );
  }
}
