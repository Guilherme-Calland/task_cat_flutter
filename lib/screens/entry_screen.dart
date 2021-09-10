import 'package:flutter/material.dart';
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/widgets/task_cat_button.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(_) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70, right: 30, left: 30),
        padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'New Task',
              style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: values.taskCatThemeColor),
            ),
            TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                color: values.taskCatThemeColor,
              ),
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'type in a new task',
                hintStyle: TextStyle(
                  color: Color(0x4b000000),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TaskCatButton(
                  inText: 'Cancel',
                  inOnPressed: () {},
                ),
                TaskCatButton(
                  inText: 'Save',
                  inOnPressed: (){},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
