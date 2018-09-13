import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  @override
  _ViewViewState createState() => _ViewViewState();
}

class _ViewViewState extends State<VideoView> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  final tag = 'VideoView:';

  @override
  void initState() {
    super.initState();
    print('$tag at init state');
    _controller = VideoPlayerController.network(
      'http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4',
    )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }
}
