import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> ajustScreenOrientation() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
  );
}

Future<dynamic> sleep({required int milliseconds}) =>
    Future.delayed(Duration(milliseconds: milliseconds));

void hideKeyboard(BuildContext inContext) {
  FocusScope.of(inContext).requestFocus(FocusNode());
}

void pushScreen(BuildContext inContext, Widget newScreen) async {
  Navigator.push(
      inContext, MaterialPageRoute(builder: (context) => newScreen)
  );
}