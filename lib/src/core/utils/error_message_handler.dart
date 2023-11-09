import 'package:dio/dio.dart';

extension ErrorHandler on Exception {
  String get errorMessage {
    try {
      final error = this as DioError;
      return ((error.response?.data as Map<dynamic, dynamic>)['message']
              as String?) ??
          'Something went wrong';
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
