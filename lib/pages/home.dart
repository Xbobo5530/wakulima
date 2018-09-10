import 'package:flutter/material.dart';
import 'package:wakulima/pages/articles_tab.dart';
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
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: [
                  Tab(
                    icon: Icon(Icons.library_books),
                    text: 'Articles',
                  ),
                  Tab(
                    icon: Icon(Icons.forum),
                    text: 'Forum',
                  ),
                  Tab(
                    icon: Icon(Icons.store_mall_directory),
                    text: 'Market',
                  ),
                ]),
                title: const Text('Wakulima'),
              ),
              body: TabBarView(children: [
                new ArticlesTab(),
                new ForumTab(),
                new MarketTab(),
              ]),
            )));
  }
}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => new _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;
//
//  void _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text(widget.title),
//      ),
//      body: new Center(
//        child: new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
//    );
//  }
//}
