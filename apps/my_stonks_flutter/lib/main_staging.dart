import 'package:my_stonks_flutter/app/app.dart';
import 'package:my_stonks_flutter/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
