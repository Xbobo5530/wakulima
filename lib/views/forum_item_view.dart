import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakulima/models/thread.dart';
import 'package:wakulima/pages/view_thread.dart';

class ForumItemView extends StatelessWidget {
  final Thread thread;
  final bool isClickable;
  ForumItemView(this.thread, this.isClickable);

  @override
  Widget build(BuildContext context) {
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
            backgroundImage: new NetworkImage(userImageUrl)),
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
          onTap: isClickable
              ? () {
                  _openThread(context, thread);
                }
              : () {}),
    ));
  }

  void _openThread(BuildContext context, Thread thread) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ViewThreadPage(thread)),
    );
  }
}
