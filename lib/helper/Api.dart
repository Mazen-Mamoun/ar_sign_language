import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.post(
      url,
      data: data,
    );

    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }
}
