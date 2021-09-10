import 'package:flutter/material.dart';
import 'package:task_cat/res/values.dart' as values;

class TaskCatButton extends StatelessWidget {
  final String inText;
  final Function() inOnPressed;
  TaskCatButton({required this.inText, required this.inOnPressed});

  @override
  Widget build(_) {
    return GestureDetector(
      onTap: inOnPressed,
      child: Container(
        child: Text(inText, style: TextStyle(color: Colors.white),),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: values.taskCatThemeColor,
          borderRadius: BorderRadius.all(Radius.circular(10),),
        ),
      ),
    );
  }
}
