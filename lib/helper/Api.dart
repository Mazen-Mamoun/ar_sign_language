import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();

  //add
  Future<Map<String, dynamic>> post({
    required String url,
    required Map<String, dynamic> data,
    required String? token,
  }) async {
    Response response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    Map<String, dynamic> jsonData = response.data;

    return jsonData;
  }

  //update
  Future<Map<String, dynamic>> put({
    required String url,
    required String userName,
    required String email,
    required String token,
  }) async {
    Response response = await dio.put(
      url,
      data: {
        'name': userName,
        'email': email,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
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
    
      return response.data;
    } else {
      throw Exception(
        'there is a problem with status code ${response.statusCode}',
      );
    }
  }
}
