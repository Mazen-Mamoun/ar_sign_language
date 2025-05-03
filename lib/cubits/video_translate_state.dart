part of 'video_translate_cubit.dart';

@immutable
sealed class VideoTranslateState {}

final class VideoTranslateInitial extends VideoTranslateState {}

class VideoTranslateCameraOn extends VideoTranslateState {
  final CameraController controller;

  VideoTranslateCameraOn(this.controller);
}

class VideoTranslateCameraOff extends VideoTranslateState {}
