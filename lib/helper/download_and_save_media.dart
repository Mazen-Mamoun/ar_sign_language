import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String> downloadAndSaveMedia(String url, String name) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final dir = await getApplicationDocumentsDirectory();
    final extension = p.extension(url).split('?').first;
    final path = '${dir.path}/$name$extension';

    final file = File(path);
    await file.writeAsBytes(response.bodyBytes);
    return path;
  } else {
    throw Exception('فشل في تحميل الوسائط');
  }
}
