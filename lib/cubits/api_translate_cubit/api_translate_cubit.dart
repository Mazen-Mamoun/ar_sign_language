import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ffmpeg_kit_flutter_new/ffmpeg_kit.dart';
import 'package:http_parser/http_parser.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
part 'api_translate_state.dart';

class ApiTranslateCubit extends Cubit<ApiTranslateState> {
  ApiTranslateCubit() : super(ApiTranslateInitial());

  bool _isTranslating = false;

  Future<void> sendImage(Uint8List imageBytes,
      {required String category}) async {
    if (_isTranslating) return;

    _isTranslating = true;
    emit(ApiTranslateLoading());

    try {
      final multipartFile = MultipartFile.fromBytes(
        imageBytes,
        filename: 'image.jpg',
        contentType: MediaType('image', 'jpeg'),
      );

      final formData = FormData.fromMap({'file': multipartFile});

      final response = await Dio().post(
        'https://d288-34-118-252-67.ngrok-free.app/predict/?mode=$category',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode == 200 && !isClosed) {
        emit(ApiTranslateSuccess(response.data['prediction']));

        await Future.delayed(const Duration(seconds: 2));
      } else if (!isClosed) {
        emit(ApiTranslateError('Error: ${response.statusCode}'));
      }
    } catch (e) {
      if (!isClosed) {
        emit(ApiTranslateError("API Error"));
        log("$Exception: ApiTranslateError('$e')");
      }
    } finally {
      _isTranslating = false;
    }
  }

}
