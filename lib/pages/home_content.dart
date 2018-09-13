import 'package:flutter/material.dart';
import 'package:flutter_fab_dialer/flutter_fab_dialer.dart';
import 'package:wakulima/pages/articles_tab.dart';
import 'package:wakulima/pages/filter_content.dart';
import 'package:wakulima/pages/forum_tab.dart';
import 'package:wakulima/pages/market_tab.dart';

const APP_NAME = 'Wakulima';
const ARTICLES_TAB_TITLE = 'Makala';
const FORUM_TAB_TITLE = 'Mijadala';
const MARKET_TAB_TITLE = 'Soko';

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
        _addArticle,
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
                    buildTab(Icons.library_books, ARTICLES_TAB_TITLE),
                    buildTab(Icons.forum, FORUM_TAB_TITLE),
                    buildTab(Icons.store_mall_directory, MARKET_TAB_TITLE),
                  ]),
                  title: const Text(APP_NAME),
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

  Tab buildTab(IconData icon, String title) {
    return Tab(
      icon: Icon(icon),
      text: title,
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
