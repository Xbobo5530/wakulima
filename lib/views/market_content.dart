import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakulima/models/product.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wakulima/pages/view_product.dart';

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
            future: DefaultAssetBundle.of(context)
                .loadString('mock_data/products.json'),
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
                      return _buildProductItemView(product);
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

  Center _buildProductItemView(Product product) {
    var topSection; //product image
    var imageUrl = product.imageUrl;
    if (imageUrl != null) {
      //show top section with image
      topSection = new Container(
        child: Image.network(imageUrl),
      );
    } else {
      topSection = new Container();
    }

    var middleSection = new ListTile(
      title: new Text(product.name),
      subtitle: new Text(product.description),
    );
    var price = product.price;
    var bottomSection = Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
      child: new Text(
        '$price',
        style: new TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.green,
          fontSize: 15.0,
        ),
      ),
    ); //product price and location

    return Center(
        child: Card(
      child: FlatButton(
        padding: EdgeInsets.all(0.0),
        child: Wrap(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            topSection,
            middleSection,
            bottomSection,
          ],
        ), onPressed: () {_openProductPage(product);},
      ),
    ));
  }

  void _openProductPage(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewProductPage(product)),
    );
  }
}
