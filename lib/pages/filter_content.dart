import 'package:flutter/material.dart';
import 'package:wakulima/pages/new_forum_thread_dialog.dart';
import 'package:wakulima/pages/new_product_dialog.dart';

const PAGE_TITLE = 'Chuja';
const _articlesText = 'Makala';
const _forumText = 'Mijadala';
const _productsText = 'Bidhaa';
const _askText = 'Uliza swali';
const _newProduct = 'Bidhaa mpya';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(PAGE_TITLE),
        ),
        body: ListView(
          children: <Widget>[
            buildArticleExpansionTile(),
            buildForumExpansionTile(context),
            buildProductExpansionTile(context)
          ],
        ));
  }

  ExpansionTile buildArticleExpansionTile() {
    return ExpansionTile(
      leading: Icon(Icons.library_books),
      title: ListTile(
        title: new Text(_articlesText),
      ),
      children: <Widget>[
        Container(
          height: 80.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildFilterCards('Mifugo'),
              _buildFilterCards('Kilimo'),
              _buildFilterCards('Mikopo'),
              _buildFilterCards('Vikundi'),
            ],
          ),
        )
      ],
    );
  }

  ExpansionTile buildForumExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.forum),
      title: ListTile(
        title: new Text(_forumText),
      ),
      children: <Widget>[
        Container(
          height: 80.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  new MaterialButton(
                      child: new Text(_askText),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () => _ask(context)),
                ],
              ),
              _buildFilterCards('Mifugo'),
              _buildFilterCards('Kilimo'),
              _buildFilterCards('Mikopo'),
              _buildFilterCards('Vikundi'),
            ],
          ),
        )
      ],
    );
  }

  ExpansionTile buildProductExpansionTile(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.store_mall_directory),
      title: ListTile(
        title: new Text(_productsText),
      ),
      children: <Widget>[
        Container(
          height: 50.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Wrap(
                children: <Widget>[
                  new MaterialButton(
                      child: new Text(_newProduct),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () => _addProduct(context)),
                ],
              ),
              _buildFilterCards('Pembejeo'),
              _buildFilterCards('Mbegu'),
              _buildFilterCards('Bidhaa za mifugo'),
              _buildFilterCards('Bidhaa za kilimo'),
            ],
          ),
        )
      ],
    );
  }

  _buildFilterCards(String title) {
    return Wrap(
      children: <Widget>[
        MaterialButton(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(title),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  void _ask(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new NewForumThreadDialog();
        },
        fullscreenDialog: true));
  }

  void _addProduct(BuildContext context) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new NewProductDialog();
        },
        fullscreenDialog: true));
  }
}
