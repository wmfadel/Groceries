import 'package:flutter/material.dart';
import 'package:groceries/src/pages/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groceries',
      routes: {
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
