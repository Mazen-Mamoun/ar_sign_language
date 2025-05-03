import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:meta/meta.dart';

part 'video_translate_state.dart';

class VideoTranslateCubit extends Cubit<VideoTranslateState> {
  VideoTranslateCubit() : super(VideoTranslateInitial());

  late CameraController controller;

  Future<void> initializeCamera(List<CameraDescription> cameras) async {
    final frontCamera = cameras[1];

    controller = CameraController(
      frontCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await controller.initialize();

    emit(VideoTranslateCameraOn(controller));
  }

  void stopCamera() {
    controller.dispose();
    emit(VideoTranslateCameraOff());
  }
}
