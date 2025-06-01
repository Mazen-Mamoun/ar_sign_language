import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/video_translate_cubit/video_translate_cubit.dart';
import 'package:tawasel/cubits/api_translate_cubit/api_translate_cubit.dart';
import 'package:tawasel/widgets/camera_translate_widgets/videp_translate_body.dart';


enum TranslateMode { word, letter, number }

class VideoTranselateView extends StatelessWidget {
  final TranslateMode mode;
  const VideoTranselateView({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => VideoTranslateCubit()),
        BlocProvider(create: (_) => ApiTranslateCubit()),
      ],
      child: Builder(builder: (context) {
        return VideoTranselateBody(
          title: getTitleFromMode(mode),
          onFrameCaptured: (Uint8List bytes) async {
            log('Frame Captured!');

            final apiCubit = context.read<ApiTranslateCubit>();
            if (mode == TranslateMode.word) {
             await apiCubit.sendImage(bytes, category: "word");
            } else if (mode == TranslateMode.letter) {
              await apiCubit.sendImage(bytes, category: "letter");
            } else if (mode == TranslateMode.number) {
              await apiCubit.sendImage(bytes, category: "number");
            }
          },
        );
      }),
    );
  }

  String getTitleFromMode(TranslateMode mode) {
    switch (mode) {
      case TranslateMode.letter:
        return 'ترجمة حرف';
      case TranslateMode.number:
        return 'ترجمة رقم';
      case TranslateMode.word:
      default:
        return 'ترجمة كلمة';
    }
  }
}
