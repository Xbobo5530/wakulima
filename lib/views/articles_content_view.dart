import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakulima/models/article.dart';
import 'package:wakulima/pages/view_article.dart';

class ArticlesContentView extends StatefulWidget {
  @override
  ArticlesContentState createState() => new ArticlesContentState();
}

class ArticlesContentState extends State<ArticlesContentView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('mock_data/articles.json'),
            builder: (context, snapshot) {
              //decode json
              var articlesData = json.decode(snapshot.data.toString());
              if (articlesData != null) {
                print('articles data: $articlesData');

                List<Article> articlesList = new List();

                for (var i = 0; i < articlesData.length; i++) {
                  var thread = Article.fromJson(articlesData[i]);
                  articlesList.add(thread);
                  print(thread);
                }

                return ListView.builder(
                  itemCount: articlesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var article = articlesList[index];
                    return _buildArticleItemView(article);
                  },
                );
              } else {
                print('articles data: $articlesData');
                return new Text('Error the articles data is null');
              }
            }),
      ),
    );
  }

  Center _buildArticleItemView(Article article) {
    var articleView; //show the image
    var imageUrl = article.imageUrl;
    if (imageUrl != null && imageUrl.isNotEmpty) {
      //show left section with image
      articleView = new ListTile(
        leading: new Image.network(imageUrl, width: 100.0,),
        title: new Text(article.title),
        subtitle: new Text(article.description),
      );
    } else {
      articleView = new ListTile(
        title: new Text(article.title),
        subtitle: new Text(article.description),
      );
    }

//    return Center(
//      child: FlatButton(
//        child: Card(
//          child: new Container(
//            constraints: BoxConstraints(maxHeight: 150.0),
//            child: articleView,
//          ),
//        ), onPressed: () {_openArticle(article);},
//      ),
//    );


    return Center(
      child: Card(
        child: FlatButton(
          child: Wrap(
            children: <Widget>[
              articleView
            ],
          ), onPressed: () {_openArticle(article);},
        ),
      ),
    );
  }

  void _openArticle(Article article) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewArticlePage(article)),
    );
  }
}