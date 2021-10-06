import 'package:flutter/material.dart';
import 'package:task_cat/res/values.dart' as values;

class TaskCatSlidableButton extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;

  TaskCatSlidableButton({required this.onPressed,required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: values.taskCatThemeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Icon(
          iconData,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
