import 'dart:convert';
import 'dart:io';

Future<String> base64Image(File? image) async {
  if (image == null) return '';
  final imageBytes = image.readAsBytesSync();
  return base64Encode(imageBytes);
}
