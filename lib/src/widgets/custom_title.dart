import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      width: screenWidth,
      height: 60,
      padding: EdgeInsets.only(top: 30,left: 20,right: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(CupertinoIcons.back),
          Text('Our products',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Icon(Icons.bookmark_border),
        ],
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: <Color>[
          Color(0xffECE9DE),
          Color(0xffefebe9),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    );
  }
}
