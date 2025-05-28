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

  Future<void> sendVideo(List<Uint8List> frames) async {
    if (_isTranslating) return;

    _isTranslating = true;
    emit(ApiTranslateLoading());

    try {
      final videoFile = await createVideoFromFrames(frames);
      final videoBytes = await videoFile.readAsBytes();

      final multipartFile = MultipartFile.fromBytes(
        videoBytes,
        filename: 'video.mp4',
        contentType: MediaType('video', 'mp4'),
      );

      final formData = FormData.fromMap({'video': multipartFile});

      final response = await Dio().post(
        'https://b619-34-139-127-232.ngrok-free.app/predict/',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );

      if (response.statusCode == 200 && !isClosed) {
        emit(ApiTranslateSuccess(response.data['word']));

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

  Future<File> createVideoFromFrames(List<Uint8List> frames) async {
    final tempDir = await getTemporaryDirectory();
    final frameDir = Directory('${tempDir.path}/frames');
    if (!frameDir.existsSync()) frameDir.createSync();

    // امسح أي صور قديمة
    frameDir.listSync().forEach((file) => file.deleteSync());

    // احفظ كل فريم كصورة jpg في المجلد
    for (int i = 0; i < frames.length; i++) {
      final file =
          File('${frameDir.path}/frame_${i.toString().padLeft(3, '0')}.jpg');
      await file.writeAsBytes(frames[i]);
    }

    final videoPath = '${tempDir.path}/output_video.mp4';
    final videoFile = File(videoPath);
    if (await videoFile.exists()) {
      await videoFile.delete();
    }
    // أمر ffmpeg لتحويل الصور لفيديو (fps=15)
    final command =
        '-framerate 15 -i ${frameDir.path}/frame_%03d.jpg -c:v libx264 -pix_fmt yuv420p $videoPath';

    final session = await FFmpegKit.execute(command);
    //final logs = await session.getAllLogsAsString();
    final returnCode = await session.getReturnCode();
   // log("FFmpeg logs: $logs");

    if (returnCode?.isValueSuccess() == true) {
      return File(videoPath);
    } else {
      throw Exception('Failed to create video');
    }
  }
}
