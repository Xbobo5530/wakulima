import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wakulima/models/comment.dart';

class CommentItemView extends StatelessWidget {
  final Comment comment;
  CommentItemView(this.comment);

  @override
  Widget build(BuildContext context) {
    var username = comment.username;
    var message = comment.comment;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(
              username,
              textAlign: TextAlign.start,
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black.withAlpha(100),
              ),
            ),
            new Text(
              message,
              textAlign: TextAlign.start,
              style: new TextStyle(
                fontSize: 16.0,
                color: Colors.black.withAlpha(200),
              ),
            ),
            new Divider()
          ]),
    );
  }
}
