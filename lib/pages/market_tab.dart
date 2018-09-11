import 'package:flutter/material.dart';
import 'package:wakulima/models/product.dart';
import 'dart:convert';

import 'package:wakulima/views/market_content.dart';

class MarketTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: new FloatingActionButton(
            tooltip: 'add new product',
            heroTag: 'add new product',
            child: new Icon(Icons.add),
            onPressed: () {
              _addNewProduct();
            }),
        body: new MarketContentView()
    );
  }

  void _addNewProduct() {}
}
