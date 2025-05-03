import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/video_translate_cubit/video_translate_cubit.dart';
import 'package:tawasel/views/videp_translate_body.dart';

class VideoTranselateView extends StatelessWidget {
  const VideoTranselateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VideoTranslateCubit(),
      child: const VideoTranselateBody(),
    );
  }
}

class TranslatedLetterDisplay extends StatelessWidget {
  final String letter;
  const TranslatedLetterDisplay({required this.letter, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 32,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            letter.isNotEmpty ? letter : 'في انتظار الإشارة...',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
