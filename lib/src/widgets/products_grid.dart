import 'package:flutter/material.dart';
import 'package:groceries/src/widgets/custom_title.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductsGrid extends StatelessWidget {
  double screenWidth, screenHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      height: screenHeight - 120,
      width: screenWidth,
      decoration: BoxDecoration(
        color: Color(0xffECE9DE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 70, bottom: 30),
            width: screenWidth,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => new Container(
                  margin: EdgeInsets.only(
                    left: index % 2 == 0 ? 10 : 0,
                    right: index % 2 == 0 ? 0 : 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: new Center(
                    child: new CircleAvatar(
                      backgroundColor: Colors.white,
                      child: new Text('$index'),
                    ),
                  )),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index == 0 ? 2 : 4),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
          ),
          CustomTitle(),
        ],
      ),
    );
  }
}
