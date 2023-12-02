import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<String> base64Image(File? image) async {
  if (image == null) return '';
  final imageBytes = image.readAsBytesSync();
  return base64Encode(imageBytes);
}

Future<void> copyToClipboard(String text) {
  return Clipboard.setData(
    ClipboardData(
      text: text,
    ),
  );
}

Future<void> openPhoneApp(String phone) async {
  final url = Uri.parse('tel:$phone');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}

Future<void> openEmailApp(String email) async {
  final url = Uri.parse('mailto:$email');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw Exception('Could not launch $url');
  }
}
