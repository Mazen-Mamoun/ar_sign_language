import 'package:tawasel/Models/exam_models/answers_model.dart';

class ExamModel {
  final int questionId;
  final String questionText;
  final List<AnswersModel> answers;

  ExamModel({
    required this.questionId,
    required this.questionText,
    required this.answers,
  });

  factory ExamModel.fromJson(Map<String, dynamic> jsonData) {
    return ExamModel(
      questionId: jsonData['id'],
      questionText: jsonData['question_text'],
      answers: jsonData['answers']
          .map<AnswersModel>((answer) => AnswersModel.fromJson(answer))
          .toList(),
    );
  }
}
