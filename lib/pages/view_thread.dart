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
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped!
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}