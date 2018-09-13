import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakulima/models/article.dart';
import 'package:wakulima/pages/view_image.dart';
import 'package:wakulima/views/video_view.dart';

class ViewArticlePage extends StatelessWidget {
  final Article article;
  ViewArticlePage(this.article);

  @override
  Widget build(BuildContext context) {
    var sourceUrl = article.sourceUrl;

    var basicInfo = new ListTile(
      title: new Text(
        article.title,
      ),
      subtitle: new Text(article.description),
    );

    var videoSection = new Container();
    var videoUrl = article.videoUrl;
    if (videoUrl != null) {
      print('at video player');
      videoSection = new Container(child: new VideoView());
    }

    var sourceButtonSection;
    if (sourceUrl != null) {
      sourceButtonSection =
          _buildSourceButton(sourceButtonSection, context, sourceUrl);
    } else {
      sourceButtonSection = new Container();
    }

    var contentSection = new Expanded(
        child: Column(
      children: <Widget>[
        basicInfo,
        videoSection,
      ],
    ));

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              elevation: 16.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(article.title,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  background:
                      _buildArticleBackground(article.imageUrl, context)),
            ),
          ];
        },
        body: Column(
          children: <Widget>[
            contentSection,
            sourceButtonSection,
          ],
        ),
      ),
    );
  }

  _buildSourceButton(
      sourceButtonSection, BuildContext context, String sourceUrl) {
    sourceButtonSection = Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: new MaterialButton(
                child: new Text('Read more',
                    style: new TextStyle(color: Colors.white)),
                color: Colors.green,
                onPressed: () {
                  _goToSource(context, sourceUrl);
                }),
          ),
        ),
      ],
    );
    return sourceButtonSection;
  }

  Container _buildArticleBackground(String imageUrl, context) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return Container(
        child: GestureDetector(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            _openImage(imageUrl, context);
          },
        ),
      );
    } else {
      return Container(
        color: Colors.green,
      );
    }
  }

  void _openImage(String imageUrl, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewImagePage(imageUrl)),
    );
  }

  void _goToSource(BuildContext context, String sourceUrl) async {
    if (await canLaunch(sourceUrl)) {
      await launch(sourceUrl, forceWebView: false);
    } else {
      _showSnackBar(context);
      throw 'Could not launch $sourceUrl';
    }
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Something went wrong'));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
