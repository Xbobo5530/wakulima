import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wakulima/models/product.dart';
import 'package:wakulima/views/market_item_view.dart';

const PRODUCTS = 'mock_data/products.json';

class MarketContentView extends StatefulWidget {
  @override
  MarketContentState createState() => new MarketContentState();
}

class MarketContentState extends State<MarketContentView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(PRODUCTS),
            builder: (context, snapshot) {
              //decode json
              var productsData = json.decode(snapshot.data.toString());
              if (productsData != null) {
                print('products data: $productsData');

                List<Product> productsList = new List();

                for (var i = 0; i < productsData.length; i++) {
                  var product = Product.fromJson(productsData[i]);
                  productsList.add(product);
                  print(product);
                }

                return new StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: productsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var product = productsList[index];
                      return new MarketItemView(product);
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.fit(productsList.length));
              } else {
                print('products data: $productsData');
                return new Text('Error the products data is null');
              }
            }),
      ),
    );
  }
}
