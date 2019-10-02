import 'package:flutter/material.dart';
import 'package:groceries/src/providers/food_provider.dart';
import 'package:groceries/src/widgets/custom_title.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:groceries/src/widgets/grid_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  double screenWidth, screenHeight;

  FoodProvider _provider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    _provider = Provider.of<FoodProvider>(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Container(
        height: screenHeight - 125,
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
              padding: EdgeInsets.only(top: 70,bottom: 5),
              width: screenWidth,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: _provider.food.length + 1,
                itemBuilder: (BuildContext context, int index) => new Container(
                    margin: EdgeInsets.only(
                      left: index % 2 == 0 ? 10 : 0,
                      right: index % 2 == 0 ? 0 : 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: index == 0
                        ? Image.asset('assets/pics/food7.png',
                            fit: BoxFit.contain)
                        : new Center(
                            child: GridItem(_provider.food[index - 1]),
                          )),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index == 0 ? 2 : 3),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
            CustomTitle(),
          ],
        ),
      ),
    );
  }
}
