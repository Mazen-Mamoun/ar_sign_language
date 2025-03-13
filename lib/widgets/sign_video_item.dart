import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignVideoItem extends StatefulWidget {
  const SignVideoItem({super.key, required this.videoPath});

  final String videoPath;

  @override
  _SignVideoItemState createState() => _SignVideoItemState();
}

class _SignVideoItemState extends State<SignVideoItem> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toPlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toPlayPause,
      child:
          _controller.value.isInitialized
              ? Stack(
                alignment: Alignment.center,
                children: [
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  if (!_controller.value.isPlaying)
                    const Icon(
                      Icons.play_circle_fill,
                      size: 50,
                      color: Colors.white,
                    ),
                ],
              )
              : const CircularProgressIndicator(),
    );
  }
}
  
