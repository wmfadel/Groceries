import 'package:flutter/material.dart';
import 'package:groceries/src/pages/home_page.dart';
import 'package:groceries/src/pages/product_details.dart';
import 'package:groceries/src/providers/cart_provider.dart';
import 'package:groceries/src/providers/food_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: FoodProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groceries',
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ProductDetails.routeName: (context) => ProductDetails(),
        },
      ),
    );
  }
}
