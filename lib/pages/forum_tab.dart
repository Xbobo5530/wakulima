import 'package:flutter/material.dart';
import 'package:wakulima/views/forum_content.dart';

class ForumTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
          tooltip: 'create a new article',
          child: new Icon(Icons.add),
          onPressed: () {
            _createNewThread();
          }),
        body: new ForumContentView()
    );
  }

  void _createNewThread() {}
}
