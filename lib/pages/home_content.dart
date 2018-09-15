import 'package:flutter/material.dart';
import 'package:wakulima/pages/articles_tab.dart';
import 'package:wakulima/pages/filter_content.dart';
import 'package:wakulima/pages/forum_tab.dart';
import 'package:wakulima/pages/market_tab.dart';
import 'package:wakulima/pages/new_forum_thread_dialog.dart';
import 'package:wakulima/pages/new_product_dialog.dart';

const APP_NAME = 'Wakulima';
const ARTICLES_TAB_TITLE = 'Makala';
const FORUM_TAB_TITLE = 'Mijadala';
const MARKET_TAB_TITLE = 'Soko';
const _newThread = 'Maada mpya';
const _newProduct = 'Bidhaa mpya';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _select(Choice choice) {
    //tried a switch statement,but requires a constant v
    if (choice == choices[0]) {
      _ask(context);
    } else if (choice == choices[1]) {
      _addProduct(context);
    } else {
      print('$tag unknown selected popup item');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.filter_list),
          onPressed: () => _openFilterPage(context)),
      body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                PopupMenuButton<Choice>(
                  onSelected: _select,
                  itemBuilder: (BuildContext context) {
                    return choices.map((Choice choice) {
                      return PopupMenuItem<Choice>(
                        value: choice,
                        child: Text(choice.title),
                      );
                    }).toList();
                  },
                ),
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

  void _addProduct(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new NewProductDialog();
        },
        fullscreenDialog: true));
  }

  void _ask(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new NewForumThreadDialog();
        },
        fullscreenDialog: true));
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: _newThread),
  const Choice(title: _newProduct),
];
