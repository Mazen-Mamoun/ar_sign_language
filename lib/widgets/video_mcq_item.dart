import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';

class VideoMcqItem extends StatefulWidget {
  const VideoMcqItem({
    super.key,
    required this.text,
    required this.video1,
    required this.video2,
    required this.questionId,
    required this.video1Id,
    required this.video2Id,
  });

  final String text;
  final String video1;
  final String video2;
  final int questionId;
  final int video1Id;
  final int video2Id;

  @override
  State<VideoMcqItem> createState() => _VideoMcqItemState();
}

class _VideoMcqItemState extends State<VideoMcqItem> {
  int? selectedId;

  late List<VideoPlayerController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = [
      VideoPlayerController.network(widget.video1),
      VideoPlayerController.network(widget.video2),
    ];

    for (var controller in _controllers) {
      controller.initialize();
      controller.setLooping(false);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void playOnce(VideoPlayerController controller) async {
    if (controller.value.isPlaying) return;
    await controller.seekTo(Duration.zero);
    controller.play();

    controller.addListener(() {
      if (controller.value.position >= controller.value.duration) {
        controller.pause();
        controller.seekTo(Duration.zero);
      }
    });
  }

  void selectAnswer(int answerId) {
    setState(() {
      selectedId = answerId;
    });

    BlocProvider.of<SubmitCubit>(context)
        .addAnswer(widget.questionId, answerId);
  }

  Widget buildVideoBox(VideoPlayerController controller, int answerId) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => playOnce(controller),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    selectedId == answerId ? Colors.blue : Colors.transparent,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            height: 120,
            width: 100,
            child: controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => selectAnswer(answerId),
          child: const Text('اختيار'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildVideoBox(_controllers[0], widget.video1Id),
              buildVideoBox(_controllers[1], widget.video2Id),
            ],
          ),
        ],
      ),
    );
  }
}
