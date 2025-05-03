import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/video_translate_cubit/video_translate_cubit.dart';
import 'package:tawasel/widgets/camera_translate_widgets/camera_preview_widget.dart';
import 'package:tawasel/widgets/camera_translate_widgets/closed_camera_widget.dart';
import 'package:tawasel/widgets/camera_translate_widgets/toggle_camera_button.dart';
import 'package:tawasel/widgets/camera_translate_widgets/translating_container.dart';
import 'package:tawasel/widgets/main_bottom_navigation_bar.dart';

class VideoTranselateBody extends StatefulWidget {
  const VideoTranselateBody({super.key});

  @override
  State<VideoTranselateBody> createState() => _VideoTranselateBodyState();
}

class _VideoTranselateBodyState extends State<VideoTranselateBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Spacer(),
            Text(
              'ترجمة فيديو',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              BlocBuilder<VideoTranslateCubit, VideoTranslateState>(
                builder: (context, state) {
                  if (state is VideoTranslateCameraOn) {
                    return CameraPreviewWidget(
                      controller: state.controller,
                    );
                  } else {
                    return const ClosedCameraWidget();
                  }
                },
              ),
              const ToggleCameraButton(),
            ],
          ),
          const TranslatingContainer(),
          const SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(currentIndex: 0),
    );
  }
}
