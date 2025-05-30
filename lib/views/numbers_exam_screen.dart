import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/exam_cubit/exam_cubit.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';
import 'package:tawasel/widgets/content_widgets/content_app_bar.dart';
import 'package:tawasel/widgets/exam_widgets/numbers_exam_section.dart';

class NumbersExamScreen extends StatelessWidget {
  const NumbersExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExamCubit>(context).getexam(categoryId: 3);

    return Scaffold(
      appBar: const ContentAppBar(text: 'الأرقام'),
      body: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          if (state is ExamLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ExamSuccess) {
            return BlocListener<SubmitCubit, SubmitState>(
              listener: (context, state) {
                if (state is SubmitSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('النتيجة'),
                      content: Text(
                        'درجتك: ${state.score.toStringAsFixed(2)}',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).popUntil(
                            (route) => route.isFirst,
                          ),
                          child: const Text('حسناً'),
                        ),
                      ],
                    ),
                  );
                } else if (state is SubmitError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                    ),
                  );
                }
              },
              child: NumbersExamSection(mcqItems: state.questions),
            );
          } else if (state is ExamError) {
            return Text(state.message);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
