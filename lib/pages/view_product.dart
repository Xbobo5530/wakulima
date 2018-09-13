import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:map_view/map_view.dart';
import 'package:wakulima/models/product.dart';

const API_KEY = "AIzaSyDXiB_QFAVQAssZqat4ApMeP9I96HWViCI";

class ViewProductPage extends StatelessWidget {
  final Product product;

  final tag = 'ViewProductPage';
  ViewProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    MapView.setApiKey(API_KEY);

    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
        new Icon(Icons.live_help),
        Colors.green,
        4.0,
        "Button menu",
        _call,
        "Piga simu",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.library_add),
        Colors.green,
        4.0,
        "Button menu",
        _whatsapp,
        "WhatsApp",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.add_shopping_cart),
        Colors.green,
        4.0,
        "Button menu",
        _email,
        "Barua pepe",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.add_shopping_cart),
        Colors.green,
        4.0,
        "Button menu",
        _sms,
        "Tuma ujumbe",
        Colors.green,
        Colors.white,
      ),
    ];

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(product.name),
          ),
          body: Center(
            child: _buildProductContent(product),
          ),
        ),
        new FabDialer(_fabMiniMenuItemList, Colors.green, new Icon(Icons.add)),
      ],
    );
  }

  _buildProductContent(Product product) {
    var imageUrl = product.imageUrl;
    var imageSection = new Container();
    if (imageUrl != null) {
      imageSection = new Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 16.0),
          child: Card(
            elevation: 4.0,
//            shape: Material(
//              borderRadius: BorderRadius.circular(10.0),
//            ).shape,
            child: Image.network(imageUrl),
          ),
        ),
      );
    }

    var name = product.name;
    var description = product.description;
    var productInfoSection = Padding(
      padding: const EdgeInsets.only(
        left: 32.0,
        right: 32.0,
      ),
      child: new ListTile(
        title: new Text(name),
        subtitle: new Text(description),
      ),
    );

    var price = product.price;
    var priceSection = Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
      child: new Card(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
            price,
            textAlign: TextAlign.center,
            style:
                new TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    var vendor = product.vendor;
    var location = product.location;
    var vendorSection = Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 8.0),
      child: new Card(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: new Icon(
                Icons.store,
                color: Colors.green,
                size: 40.0,
              ),
            ),
            Expanded(
              child: new ListTile(
                title: Text(vendor),
                subtitle: Text(location),
              ),
            )
          ],
        ),
      ),
    );

    var staticMapProvider = new StaticMapProvider(API_KEY);
    var staticMapUri;
    var mapSection;

    staticMapUri = staticMapProvider.getStaticUri(Locations.iringa, 12,
        width: 900, height: 400, mapType: StaticMapViewType.roadmap);
    mapSection = new Container(
      child: new Image.network(staticMapUri.toString()),
    );
    //todo fix magic code
    switch (location) {
      case 'Iringa':
        staticMapUri = staticMapProvider.getStaticUri(Locations.iringa, 12,
            width: 900, height: 400, mapType: StaticMapViewType.roadmap);
        mapSection = new Container(
          child: new Image.network(staticMapUri.toString()),
        );
        break;
      case 'Dodoma':
        staticMapUri = staticMapProvider.getStaticUri(Locations.dodoma, 12,
            width: 900, height: 400, mapType: StaticMapViewType.roadmap);
        mapSection = new Container(
          child: new Image.network(staticMapUri.toString()),
        );
        break;
      case 'Dar es salaam':
        staticMapUri = staticMapProvider.getStaticUri(Locations.darEsSalaam, 12,
            width: 900, height: 400, mapType: StaticMapViewType.roadmap);
        mapSection = new Container(
          child: new Image.network(staticMapUri.toString()),
        );
        break;
    }

    return ListView(
      children: <Widget>[
        imageSection,
        productInfoSection,
        priceSection,
        vendorSection,
        mapSection
      ],
    );
  }

  void _sms() {}

  void _email() {}

  void _whatsapp() {}

  void _call() {}
}
