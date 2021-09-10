import 'package:flutter/material.dart';
import 'package:task_cat/res/values.dart' as values;

class TitleSection extends StatelessWidget {
  @override
  Widget build(_) {
    return Container(
      padding: EdgeInsets.only(
        top: 80,
        left: 30,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.list,
              color: values.taskCatThemeColor,
            ),
            backgroundColor: Colors.white,
            radius: 30.0,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Task Cat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '5 tasks',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
