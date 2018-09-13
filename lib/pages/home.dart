import 'package:flutter/material.dart';
import 'package:wakulima/pages/home_content.dart';

class Wakulima extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ),
        home: new HomePage());
  }
}
