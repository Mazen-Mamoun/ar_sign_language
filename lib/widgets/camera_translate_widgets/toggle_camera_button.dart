import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/video_translate_cubit/video_translate_cubit.dart';
import 'package:tawasel/helper/constants.dart';

class ToggleCameraButton extends StatelessWidget {
  const ToggleCameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> initializeCamera() async {
      final cameras = await availableCameras();
      BlocProvider.of<VideoTranslateCubit>(context).initializeCamera(cameras);
    }

    bool isCameraOn = false;

    return BlocConsumer<VideoTranslateCubit, VideoTranslateState>(
      listener: (context, state) {
        if (state is VideoTranslateCameraOn) {
          isCameraOn = true;
        } else {
          isCameraOn = false;
        }
      },
      builder: (context, state) {
        return Positioned(
          bottom: 32,
          left: MediaQuery.of(context).size.width * 0.5 - 25,
          child: Card(
            elevation: 3,
            color: kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: IconButton(
                onPressed: () {
                  if (isCameraOn) {
                    BlocProvider.of<VideoTranslateCubit>(context).stopCamera();
                  } else {
                    initializeCamera();
                  }
                },
                icon: Icon(
                  color: Colors.black,
                  isCameraOn ? Icons.videocam_off : Icons.videocam,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
