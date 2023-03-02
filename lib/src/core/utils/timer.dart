Stream<int> timer(int seconds) =>
    Stream.periodic(const Duration(seconds: 1), (i) {
      return seconds - i;
    }).take(seconds + 1);

String timeLeft(int seconds) {
  final minutes = seconds ~/ 60;
  final secondsLeft = seconds - (minutes * 60);
  return '${minutes.toString().padLeft(2, '0')}:'
      '${secondsLeft.toString().padLeft(2, '0')}';
}
