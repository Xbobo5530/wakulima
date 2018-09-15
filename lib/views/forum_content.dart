import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wakulima/models/thread.dart';
import 'package:wakulima/views/forum_item_view.dart';

const THREADS = 'mock_data/threads.json';

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
            future: DefaultAssetBundle.of(context).loadString(THREADS),
            builder: (context, snapshot) {
              //decode json
              var forumData = json.decode(snapshot.data.toString());
              if (forumData != null) {
                List<Thread> threadsList = new List();

                for (var i = 0; i < forumData.length; i++) {
                  var thread = Thread.fromJson(forumData[i]);
                  threadsList.add(thread);
                }

                return ListView.builder(
                  itemCount: threadsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var thread = threadsList[index];
                    return new ForumItemView(thread, true);
                  },
                );
              } else {
                print('forum data: $forumData');
                return new CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
