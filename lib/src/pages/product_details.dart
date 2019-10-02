import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groceries/src/models/food.dart';
import 'package:groceries/src/providers/cart_provider.dart';
import 'package:groceries/src/providers/food_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static final String routeName = '/details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Food _food;
  Map<String, dynamic> args;
  CartProvider _cartProvider;
  FoodProvider _foodProvider;
  double screenWidth, screenHeight;
  bool isFavorite = false;
  int amount = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    _cartProvider = Provider.of<CartProvider>(context);
    _foodProvider = Provider.of<FoodProvider>(context);
    args = ModalRoute.of(context).settings.arguments;
    if (args.containsKey('id')) {
      _food =
          _foodProvider.food.firstWhere((Food food) => food.id == args['id']);
    } else {
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  icon: Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ),
          buildBodyColumn(),
          Align(
            alignment: Alignment.bottomCenter,
            child: buildActionsContainer(),
          )
        ],
      ),
    );
  }

  Widget buildBodyColumn() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: screenWidth,
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.25),
            child:  Hero(
                tag: '${_food.id}',
                child: Image.asset(
                  _food.image,
                  height: 200,
                  width: screenWidth * 0.5,
                  fit: BoxFit.cover,
                ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Text(
              _food.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            width: screenWidth * 0.9,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(
              '${_food.weight}g',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildAmountButton(),
                Text(
                  '\$${(amount * _food.price).toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 10),
            child: Text(
              'About the product',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.fade,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 75)
        ],
      ),
    );
  }

  Widget buildAmountButton() {
    return Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: Colors.grey, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.remove),
            onTap: () {
              setState(() {
                if (amount > 1) --amount;
              });
            },
            onLongPressStart: (_) {
              setState(() {
                amount = 1;
              });
            },
          ),
          Text('$amount'),
          GestureDetector(
            child: Icon(Icons.add),
            onTap: () {
              setState(() {
                if (amount < 25) ++amount;
              });
            },
            onLongPressStart: (_) {
              setState(() {
                amount = 25;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget buildActionsContainer() {
    return Container(
      color: Color(0xfffafafa),
      width: screenWidth,
      height: 80,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Center(
                  child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      })),
            ),
            MaterialButton(
              onPressed: () {
                _cartProvider.addFood(_food);
                _foodProvider.food[args['id']].amount = amount;
                Navigator.of(context).pop();
              },
              color: Colors.amber[600],
              elevation: 0,
              child: Text(
                'Add to cart',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              height: 50,
              minWidth: screenWidth - 150,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(45)),
            )
          ],
        ),
      ),
    );
  }
}

final String text =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book';
