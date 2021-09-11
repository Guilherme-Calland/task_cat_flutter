import 'package:flutter/material.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/screens/entry_screen.dart';

class TaskCatAvatar extends StatelessWidget {
  final Image image;
  final Function() callback;
  TaskCatAvatar({required this.image, required this.callback});
  @override
  Widget build(BuildContext inContext) {
    return GestureDetector(
      onTap: () {
        utils.pushScreen(inContext, EntryScreen());
      },
      onLongPress: callback,
      child: image,
    );
  }
}

