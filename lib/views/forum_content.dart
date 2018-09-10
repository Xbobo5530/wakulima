import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakulima/models/thread.dart';

class ForumContentView extends StatefulWidget {
  @override
  ForumContentState createState() => new ForumContentState();
}

class ForumContentState extends State<ForumContentView> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('mock_data/threads.json'),
            builder: (context, snapshot) {
              //decode json
              var forumData = json.decode(snapshot.data.toString());
              if (forumData != null) {
                print('forum data: $forumData');

                List<Thread> threadsList = new List();

                for (var i = 0; i < forumData.length; i++) {
                  var thread = Thread.fromJson(forumData[i]);
                  threadsList.add(thread);
                  print(thread);
                }

                return ListView.builder(
                  itemCount: threadsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var thread = threadsList[index];
                    return _buildForumItemView(thread);
                  },

                );
              } else {
                print('forum data: $forumData');
                return new Text('Error the forum data is null');
              }
            }),
      ),
    );
  }

  Center _buildForumItemView(Thread thread) {
    return Center(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTile(
                title: new Text(thread.title),
                subtitle: new Text(thread.description),
              )
            ],
          ),
        ));
  }
}
