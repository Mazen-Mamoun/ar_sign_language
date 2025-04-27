class ItemModel {
  final String mediaPath;
  final String text;

  ItemModel({required this.mediaPath, required this.text});
  factory ItemModel.fromJson(Map<String, dynamic> jsonData) {
    const String baseUrl = 'https://finalproject.mass-fluence.com/';
    return ItemModel(
      mediaPath: baseUrl + jsonData['attachment'],
      text: jsonData['description'],
    );
  }
}
