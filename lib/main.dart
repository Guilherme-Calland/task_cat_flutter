import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/screens/entry_screen.dart';
import 'package:task_cat/screens/home_screen.dart';
import 'package:task_cat/shared_data/task_cat_shared_data.dart';

void main() async {
  await utils.ajustScreenOrientation();
  runApp(TaskCat());
}

class TaskCat extends StatelessWidget {
  @override
  Widget build(_) {
    return ChangeNotifierProvider(
      create: (context) => TaskCatSharedData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(
              fontSize: 20,
            ),
          ),
          fontFamily: 'PatrickHand',
          scaffoldBackgroundColor: values.taskCatThemeColor,
          primarySwatch: values.taskCatThemeMaterialColor,
          textSelectionTheme:
            TextSelectionThemeData(
              cursorColor: values.taskCatThemeColor
            ),
        ),
        home: Consumer<TaskCatSharedData>(
          builder: (_, data, __){
            return IndexedStack(
              index: data.stackIndex,
              children: [
                HomeScreen(),
                EntryScreen(),
              ],
            );
          },
        ),
      ),
    );
  }
}
