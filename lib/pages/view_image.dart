import 'package:flutter/material.dart';
import 'package:zoomable_image/zoomable_image.dart';

class ViewImagePage extends StatelessWidget {
  final String imageUrl;
  ViewImagePage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: Container(
        child: Center(
          child: new ZoomableImage(new NetworkImage(imageUrl),
              placeholder:
                  const Center(child: const CircularProgressIndicator()),
              backgroundColor: Colors.black),
        ),
        color: Colors.black,
      ),
    );
  }
}
