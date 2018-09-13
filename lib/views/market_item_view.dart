import 'package:flutter/material.dart';
import 'package:wakulima/models/product.dart';
import 'package:wakulima/pages/view_product.dart';

class MarketItemView extends StatelessWidget {
  final Product product;
  MarketItemView(this.product);

  @override
  Widget build(BuildContext context) {
    var topSection; //product image
    var imageUrl = product.imageUrl;
    if (imageUrl != null) {
      topSection = new Container(
        child: Image.network(imageUrl),
      );
    } else {
      topSection = new Container();
    }

    var middleSection = new ListTile(
      title: new Text(product.name),
      subtitle: new Text(
        product.description,
        maxLines: 3,
      ),
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
          children: <Widget>[
            topSection,
            middleSection,
            bottomSection,
          ],
        ),
        onPressed: () {
          _openProductPage(context, product);
        },
      ),
    ));
  }

  void _openProductPage(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewProductPage(product)),
    );
  }
}
