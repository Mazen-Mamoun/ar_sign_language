import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'video_translate_state.dart';

class VideoTranslateCubit extends Cubit<VideoTranslateState> {
  VideoTranslateCubit() : super(VideoTranslateInitial());

  late CameraController controller;
  Timer? _frameTimer;
  bool _cameraActive = false;
  bool _isSending = false;

  Future<void> initializeCamera(
    List<CameraDescription> cameras,
    void Function(Uint8List imageBytes) onFrameCaptured,
  ) async {
    final frontCamera = cameras[1];

    controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await controller.initialize();

    emit(VideoTranslateCameraOn(controller));
    _startSendingFrames(onFrameCaptured);
  }

  void _startSendingFrames(void Function(Uint8List) onFrameCaptured) {
    _cameraActive = true;
    _frameTimer = Timer.periodic(const Duration(seconds: 2), (_) async {
      if (!_cameraActive ||
          !controller.value.isInitialized ||
          isClosed ||
          _isSending) return;

      try {
        _isSending = true;

        final image = await controller.takePicture();
        final bytes = await image.readAsBytes();

        onFrameCaptured(
            bytes); // This triggers sendImage() in ApiTranslateCubit

        // Delay after capturing to give time for response display
        await Future.delayed(const Duration(seconds: 2));
      } catch (e) {
        log('Error capturing frame: $e');
      } finally {
        _isSending = false;
      }
    });
  }

  void stopCamera() {
    _cameraActive = false;
    controller.dispose();
    _frameTimer?.cancel();

    if (!isClosed) {
      emit(VideoTranslateCameraOff());
    }
  }
}

