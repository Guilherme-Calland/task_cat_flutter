import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> ajustScreenOrientation() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
  );
}
