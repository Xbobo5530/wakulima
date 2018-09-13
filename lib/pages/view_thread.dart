import 'package:flutter/material.dart';
import 'package:wakulima/models/comment.dart';
import 'package:wakulima/models/thread.dart';
import 'package:wakulima/views/comment_item_view.dart';
import 'package:wakulima/views/forum_item_view.dart';

const tag = 'ViewThreadPage:';

class ViewThreadPage extends StatelessWidget {
  final Thread thread;

  ViewThreadPage(this.thread);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thread.title),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.cancel,
              ),
              onPressed: () => _closeThread(context))
        ],
      ),
      body: _buildForumContent(context, thread),
      floatingActionButton: new FloatingActionButton(
          child: Icon(Icons.reply),
          onPressed: () {
            _replyThread(context);
          }),
    );
  }

  Column _buildForumContent(BuildContext context, Thread thread) {
    var commentSection = _buildCommentSection();
    var headerSection = _buildHeaderSection(thread);
    var contactSection = Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: new MaterialButton(
                child: new Text('Wasiliana na mtaalamu'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _contactSpecialist(context)),
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        headerSection,
        contactSection,
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

  void _replyThread(BuildContext context) async {
    //todo open reply dialog
    var _replyController = new TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Toa Maoni'),
          content: new TextField(
            maxLines: 2,
            autofocus: false,
            decoration: new InputDecoration(
                labelText: 'Toa maoni',
                hintText: 'Toa maoni yako juu maada hii'),
            controller: _replyController,
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Funga')),
            MaterialButton(
              child: new Text('Wasilisha'),
              onPressed: () {
                _submitComment(context, _replyController);
              },
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        );
      },
    );
  }

  void _submitComment(BuildContext context, TextEditingController controller) {
    var message = controller.text;
    controller.clear();
    Navigator.pop(context);
  }

  _closeThread(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Zingatia'),
            content: Text('Je, unauhakika unataka kufunga maada hii?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: new Text('Hapana'),
              ),
              MaterialButton(
                child: new Text('Funga maada'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {
                  _confirmedCloseThread(context);
                },
              ),
            ],
          );
        });
  }

  void _confirmedCloseThread(BuildContext context) {
    Navigator.pop(context);
    _showSnackBar(context);
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Maada hii imefungwa'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _contactSpecialist(BuildContext context) async {
    var _nameFieldController = new TextEditingController();
    var _phoneFieldController = new TextEditingController();
    var _whatsappFieldController = new TextEditingController();
    var _emailFieldController = new TextEditingController();
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Wasiliana na mtaalam'),
            content: Wrap(
              children: <Widget>[
                _buildField(_nameFieldController, 'Jina'),
                _buildField(_phoneFieldController, 'Simu'),
                _buildField(_whatsappFieldController, 'WhatsApp'),
                _buildField(_emailFieldController, 'Barua pepe'),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('Funga')),
              MaterialButton(
                child: new Text('Wasilisha'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () => _submitContactDetails(),
              )
            ],
          );
        });
  }

  _buildField(TextEditingController controller, String hintText) {
    return new TextField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
    );
  }

  _submitContactDetails() {
    //todo submit the contact details to specialist
  }
}
