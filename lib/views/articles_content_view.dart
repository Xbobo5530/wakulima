import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakulima/models/article.dart';

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
                    return _buildForumItemView(article);
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

  Center _buildForumItemView(Article article) {

    var leftSection; //show the image
    var imageUrl = article.imageUrl;
    if (imageUrl != null){
      //show left section with image
      leftSection = new Container(
        child: Image.network(imageUrl),
      );
    }else{
      leftSection = new Container();
    }

    var rightSection = new ListTile(
      title: new Text(article.title),
      subtitle: new Text(article.description),
    );


    return Center(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              leftSection,
              rightSection,
            ],
          ),
        ));
  }
}
