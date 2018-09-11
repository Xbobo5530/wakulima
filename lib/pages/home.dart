import 'package:flutter/material.dart';
import 'package:wakulima/pages/articles_tab.dart';
import 'package:wakulima/pages/filter_content.dart';
import 'package:wakulima/pages/forum_tab.dart';
import 'package:wakulima/pages/market_tab.dart';

class Wakulima extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Scaffold(
          body: DefaultTabController(
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
        ));
  }

  //todo fix go to filter page bug
  void _openFilterPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new FilterPage()),
    );
  }
}
