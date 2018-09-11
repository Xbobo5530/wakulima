import 'package:flutter/material.dart';
import 'package:wakulima/views/articles_content_view.dart';

class ArticlesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          tooltip: 'create a new article',
          heroTag: 'create new article',
          child: new Icon(Icons.add),
          onPressed: () {
            _createNewArticle();
          }),
        body: new ArticlesContentView()
    );
  }

  void _createNewArticle() {}
}
