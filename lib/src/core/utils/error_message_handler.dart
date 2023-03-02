extension ErrorHandler on Exception {
  String get errorMessage {
    try {
      final error = this;
      return error.toString();
    } catch (e) {
      return 'Something went wrong';
    }
  }
}
