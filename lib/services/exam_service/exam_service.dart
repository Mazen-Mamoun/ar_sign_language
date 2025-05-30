import 'package:tawasel/Cubits/auth_cubit/auth_cubit.dart';
import 'package:tawasel/Models/exam_models/exam_model.dart';
import 'package:tawasel/helper/Api.dart';

class ExamsService {
  Future<List<ExamModel>> getexamByCategory({
    required int categoryId,
  }) async {
    String token = await AuthCubit().getToken();

    Map<String, dynamic> response = await Api().get(
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      url:
          'https://finalproject.mass-fluence.com/api/exams/$categoryId/questions',
    );

    List<ExamModel> examList = [];
    List<dynamic> examData = response['questions'];

    for (var item in examData) {
      examList.add(ExamModel.fromJson(item));
    }

    return examList;
  }

  Future<num> submitExam({
    required int categoryId,
    required List<Map<String, int>> answers,
  }) async {
    String token = await AuthCubit().getToken();

    final response = await Api().post(
      url: 'https://finalproject.mass-fluence.com/api/exams/$categoryId/submit',
      data: {
        "answers": answers,
      },
      token: token,
    );

    return response['score'];
  }
}
