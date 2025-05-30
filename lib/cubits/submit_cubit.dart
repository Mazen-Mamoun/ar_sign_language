import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tawasel/Services/exam_services/exam_service.dart';
part 'submit_state.dart';

class SubmitCubit extends Cubit<SubmitState> {
  List<Map<String, int>> answers = [];

  SubmitCubit() : super(SubmitInitial());

  void addAnswer(int questionId, int answerId) {
    answers.removeWhere((answer) => answer['question_id'] == questionId);
    answers.add(
      {
        'question_id': questionId,
        'answer_id': answerId,
      },
    );
  }

  Future<void> getExamScore({
    required int categoryId,
  }) async {
    emit(SubmitLoading());

    try {
      final score = await ExamsService().submitExam(
        categoryId: categoryId,
        answers: answers,
      );
      answers = [];

      emit(SubmitSuccess(score));
    } catch (e) {
      emit(
        SubmitError(e.toString()),
      );
    }
  }
}
