import 'package:flutter/material.dart';
import 'package:wakulima/models/comment.dart';
import 'package:wakulima/models/thread.dart';
import 'package:wakulima/views/comment_item_view.dart';
import 'package:wakulima/views/forum_item_view.dart';

class ViewThreadPage extends StatelessWidget {
  final Thread thread;

  final tag = 'ViewThreadPage:';
  ViewThreadPage(this.thread);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thread.title),
      ),
      body: _buildForumContent(thread),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.reply),
          onPressed: () {
            _replyThread();
          }),
    );
  }

  Column _buildForumContent(Thread thread) {
    var commentSection = _buildCommentSection();
    var headerSection = _buildHeaderSection(thread);

    return Column(
      children: <Widget>[
        headerSection,
        commentSection,
      ],
    );
  }

  _buildHeaderSection(Thread thread) {
    return new ForumItemView(thread, false);
  }

  _buildCommentSection() {
    var commentsData = thread.comments;
    if (commentsData != null) {
      //thread has comments
      List<Comment> commentsList = new List();
      for (var i = 0; i < commentsData.length; i++) {
        var comment = Comment.fromJson(commentsData[i]);
        commentsList.add(comment);
      }

      return Expanded(
        child: Container(
          height: 500.0,
          child: ListView.builder(
            itemCount: commentsList.length,
            itemBuilder: (BuildContext context, int index) {
              var comment = commentsList[index];
              return new CommentItemView(comment);
            },
          ),
        ),
      );
    } else {
      return new Container(
        child: new Text('toa maoni yako'),
      );
    }
  }

  void _replyThread() {
    //todo open reply dialog
  }
}
