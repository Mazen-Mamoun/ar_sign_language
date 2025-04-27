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

  
  Future<dynamic> get({
    required String url,
    required Map<String, String> headers,
  }) async {
    final Response response = await dio.get(
      url,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      // print(response.data);
      return response.data;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
