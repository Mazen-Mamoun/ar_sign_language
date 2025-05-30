class AnswersModel {
  final String answer;
  final int answerId;

  AnswersModel({
    required this.answer,
    required this.answerId,
  });

  factory AnswersModel.fromJson(Map<String, dynamic> json) {
    const String baseUrl = 'https://finalproject.mass-fluence.com/';

    return AnswersModel(
      answer: baseUrl + json['answer'],
      answerId: json['id'],
    );
  }
}
