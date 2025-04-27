import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SignVideoItem extends StatefulWidget {
  const SignVideoItem({super.key, required this.videoPath});

  final String videoPath;

  @override
  _SignVideoItemState createState() => _SignVideoItemState();
}

class _SignVideoItemState extends State<SignVideoItem>
    with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(false);
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
    super.build(context);
    return GestureDetector(
      onTap: _toPlayPause,
      child: _controller.value.isInitialized
          ? Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
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
