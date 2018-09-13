import 'package:flutter/material.dart';
import 'package:wakulima/models/product.dart';
import 'package:wakulima/models/thread.dart';

class ViewThreadPage extends StatelessWidget {

  final Thread thread;
  ViewThreadPage(this.thread);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thread.title),
      ),
      body: _buildForumContent(thread),
    );
  }

  Column _buildForumContent(Thread thread) {
    return Column(
      children: <Widget>[
        Card(
          child: Wrap(
            children: <Widget>[
              new ListTile(
                title: new Text(thread.title),
                subtitle: new Text(thread.description),
              ),

            ],
          ),
        ),
      ],
    );
  }
}