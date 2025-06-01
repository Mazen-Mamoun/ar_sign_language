import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/exam_cubit/exam_cubit.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';
import 'package:tawasel/widgets/content_widgets/content_app_bar.dart';
import 'package:tawasel/widgets/exam_widgets/mcq_section.dart';

class WordsExamScreen extends StatelessWidget {
  const WordsExamScreen({super.key});

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<ExamCubit>(context).getexam(categoryId: 5);

    return Scaffold(
      appBar: const ContentAppBar(text: 'الكلمات'),
      body: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          if (state is ExamLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExamSuccess) {
            return BlocListener<SubmitCubit, SubmitState>(
              listener: (context, state) {
                if (state is SubmitSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('النتيجة'),
                      content: Text('درجتك: ${state.score}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .popUntil((route) => route.isFirst),
                          child: const Text('حسناً'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SubmitError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'اختر الكلمة الصحيحة بناءً على الإشارة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        McqSection(items: state.questions),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is ExamError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
