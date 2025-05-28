import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/cubits/api_translate_cubit/api_translate_cubit.dart';

class TranslatingContainer extends StatelessWidget {
  const TranslatingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(22),
              child: BlocBuilder<ApiTranslateCubit, ApiTranslateState>(
                builder: (context, state) {
                  //log('ApiTranslateCubit state changed: $state'); // Debug print
                  if (state is ApiTranslateLoading) {
                    return const Text("جاري الترجمة...");
                  } else if (state is ApiTranslateSuccess) {
                    return Text(
                      state.translatedLetter,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    );
                  } else if (state is ApiTranslateError) {
                    return Text("خطأ: ${state.message}");
                  } else {
                    return const Text("ابدأ الترجمة");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
