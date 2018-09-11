import 'package:flutter/material.dart';
import 'package:wakulima/models/article.dart';

class ViewArticlePage extends StatelessWidget {

  final Article article;
  ViewArticlePage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}