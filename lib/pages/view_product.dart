import 'package:flutter/material.dart';
import 'package:wakulima/models/product.dart';

class ViewProductPage extends StatelessWidget {

  final Product product;
  ViewProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}