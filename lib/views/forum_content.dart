import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wakulima/models/thread.dart';
import 'package:wakulima/pages/view_thread.dart';

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
    var title = thread.title;
    var description = thread.description;
    var userImageUrl = thread.userImageUrl;
    var leftSection;
    if (userImageUrl != null) {
      leftSection = Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
        child: new CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.green,
          backgroundImage: new NetworkImage(userImageUrl)
        ),
      );
    } else {
      leftSection = new Container();
    }

    var rightSection = Expanded(
      child: new ListTile(
        title: new Text(title),
        subtitle: new Text(description),
      ),
    );

    return Center(
        child: Card(
      child: GestureDetector(
        child: Row(
          children: <Widget>[
            leftSection,
            rightSection,
          ],
        ),
        onTap: () {
          _openThread(thread);
        },
      ),
    ));
  }

  void _openThread(Thread thread) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewThreadPage(thread)),
    );
  }
}
