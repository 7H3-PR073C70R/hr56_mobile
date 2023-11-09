import 'package:hr56_staff/src/app/app.dart';
import 'package:hr56_staff/src/app/bootstrap.dart';

void main() async {
  await initApp();
  await bootstrap(App.new);
}
