import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/video_translate_cubit/video_translate_cubit.dart';
import 'package:tawasel/helper/constants.dart';

class ToggleCameraButton extends StatelessWidget {
     final Future<void> Function(Uint8List bytes) onFrameCaptured;
  const ToggleCameraButton({super.key,    required this.onFrameCaptured,
});

  @override
  Widget build(BuildContext context) {
   
Future<void> initializeCamera() async {
  final cameras = await availableCameras();
  BlocProvider.of<VideoTranslateCubit>(context).initializeCamera(
        cameras,
        onFrameCaptured, // دي الدالة اللي اتبعتت من بره
      );
}

    return BlocConsumer<VideoTranslateCubit, VideoTranslateState>(
      listener: (context, state) {
        if (state is VideoTranslateCameraOn) {
        } else {
        }
      },
      builder: (context, state) {
        final isCameraOn = state is VideoTranslateCameraOn;

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
