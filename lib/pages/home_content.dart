import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:wakulima/pages/articles_tab.dart';
import 'package:wakulima/pages/filter_content.dart';
import 'package:wakulima/pages/forum_tab.dart';
import 'package:wakulima/pages/market_tab.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _fabMiniMenuItemList = [
      new FabMiniMenuItem.withText(
        new Icon(Icons.live_help),
        Colors.green,
        4.0,
        "Button menu",
        _ask,
        "Uliza swali",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.library_add),
        Colors.green,
        4.0,
        "Button menu",
        _addProduct,
        "Makala mpya",
        Colors.green,
        Colors.white,
      ),
      new FabMiniMenuItem.withText(
        new Icon(Icons.add_shopping_cart),
        Colors.green,
        4.0,
        "Button menu",
        _addProduct,
        "Tangaza bidhaa",
        Colors.green,
        Colors.white,
      ),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  actions: <Widget>[
                    IconButton(
                        icon: new Icon(Icons.filter_list),
                        onPressed: () {
                          _openFilterPage(context);
                        })
                  ],
                  bottom: TabBar(tabs: [
                    Tab(
                      icon: Icon(Icons.library_books),
                      text: 'Makala',
                    ),
                    Tab(
                      icon: Icon(Icons.forum),
                      text: 'Mijadala',
                    ),
                    Tab(
                      icon: Icon(Icons.store_mall_directory),
                      text: 'Soko',
                    ),
                  ]),
                  title: const Text('Wakulima'),
                ),
                body: TabBarView(children: [
                  new ArticlesTab(),
                  new ForumTab(),
                  new MarketTab(),
                ]),
              )),
          new FabDialer(
              _fabMiniMenuItemList, Colors.green, new Icon(Icons.add)),
        ],
      ),
    );
  }

  void _openFilterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new FilterPage()),
    );
  }

  void _addProduct() {
    //todo add new product
  }
  void _addArticle() {
    //todo add new article
  }
  void _ask() {
    //todo add new forum thread
  }
}
