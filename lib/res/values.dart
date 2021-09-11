import 'package:flutter/material.dart';
import 'package:task_cat/database/database_helper.dart';

Color taskCatThemeColor = Color(0xffffb469);

Map<int, Color> taskCatThemeColorMap = {
  50: taskCatThemeColor,
  100: taskCatThemeColor,
  200: taskCatThemeColor,
  300: taskCatThemeColor,
  400: taskCatThemeColor,
  500: taskCatThemeColor,
  600: taskCatThemeColor,
  700: taskCatThemeColor,
  800: taskCatThemeColor,
  900: taskCatThemeColor
};

MaterialColor taskCatThemeMaterialColor = MaterialColor(0xffffb469, taskCatThemeColorMap);

final database = DatabaseHelper();

