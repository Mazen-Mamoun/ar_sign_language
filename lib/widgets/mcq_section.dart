import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';
import 'package:tawasel/Models/exam_models/exam_model.dart';
import 'package:tawasel/helper/constants.dart';
import 'package:tawasel/widgets/exam_widgets/mcq_item.dart';

class McqSection extends StatelessWidget {
  const McqSection({super.key, required this.items});
  final List<ExamModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (buildContext, index) {
            return McqItem(
              text: items[index].questionText,
              image1: items[index].answers[0].answer,
              image2: items[index].answers[1].answer,
              image3: items[index].answers[2].answer,
              questionId: items[index].questionId,
              image1Id: items[index].answers[0].answerId,
              image2Id: items[index].answers[1].answerId,
              image3Id: items[index].answers[2].answerId,
            );
          },
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              elevation: 5,
            ),
            onPressed: () {
              if (BlocProvider.of<SubmitCubit>(context).answers.length !=
                  items.length) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'يرجى الإجابة على جميع الأسئلة قبل الإرسال',
                    ),
                  ),
                );
                return;
              }
              BlocProvider.of<SubmitCubit>(context).getExamScore(
                categoryId: 4,
              );
            },
            child: const Text(
              'إرسال',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
