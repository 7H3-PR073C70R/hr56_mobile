/// All the endpoint used in this project are to be declared
/// in this class.
///
/// Example
///
/// static Uri authUrl =
///  Uri(scheme: 'https', host: 'oxygen.com', path: '/api/v1/auth')
class AppApiEndpoint {
  const AppApiEndpoint._();
  static const String scheme = 'https';
  static const String host = '....com';
  static const int receiveTimeout = 50000;
  static const int sendTimeout = 50000;

  static Uri baseUri = Uri(scheme: scheme, host: host, path: '/api/v1');
}
