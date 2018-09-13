import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:map_view/map_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakulima/keys/keys.dart';
import 'package:wakulima/models/contact.dart';
import 'package:wakulima/models/product.dart';

const tag = 'ViewProductPage';

class ViewProductPage extends StatelessWidget {
  final Product product;

  ViewProductPage(this.product);

  @override
  Widget build(BuildContext context) {
    MapView.setApiKey(API_KEY);

    Contact contact = _getContact();
    var phoneNumber = contact.phone;
    var phoneUrl = 'tel:$phoneNumber';
    var smsUrl = 'sms:$phoneNumber';
    var email = contact.email;
    var emailUrl = 'mailto:$email';
    var whatsapp = contact.whatsapp;
    var whatsappUrl = 'whatsapp:$whatsapp';

    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
        new Icon(Icons.contact_phone),
        Colors.green,
        4.0,
        "Button menu",
        () => _action(phoneUrl),
        "Piga simu",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.chat_bubble_outline),
        Colors.green,
        4.0,
        "Button menu",
        () => _action(whatsappUrl),
        "WhatsApp",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.email),
        Colors.green,
        4.0,
        "Button menu",
        () => _action(emailUrl),
        "Barua pepe",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.message),
        Colors.green,
        4.0,
        "Button menu",
        () => _action(smsUrl),
        "Tuma ujumbe",
        Colors.green,
        Colors.white,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: _buildProductContent(product),
          ),
          new FabDialer(
              _fabMiniMenuItemList, Colors.green, new Icon(Icons.call)),
        ],
      ),
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
    var staticMapUri = new Uri();
    var mapSection = new Container();

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

  _action(String url) async {
    if (!url.contains('whatsapp')) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      bool hasWhatsapp = await FlutterLaunch.hasApp(name: 'whatsapp');
      if (hasWhatsapp) {
        var whatsappNumber = url.substring(url.indexOf(':'));
        print('$tag whatsapp url is $whatsappNumber');
        await FlutterLaunch.launchWathsApp(
            phone: '$whatsappNumber', message: '');
      } else {
        print("$tag Whatsapp is not installed");
      }
    }
  }

  Contact _getContact() {
    assert(product.contact != null);
    var contactData = product.contact;
    List<Contact> contactList = new List();
    for (var i = 0; i < contactData.length; i++) {
      Contact contact = Contact.fromJson(contactData[i]);
      contactList.add(contact);
    }
    return contactList[0];
  }
}
