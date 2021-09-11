import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/shared_data/task_cat_shared_data.dart';

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    final provider = Provider.of<TaskCatSharedData>(inContext, listen: true);
    final numTasks = provider.taskList.length;
    return Container(
      padding: EdgeInsets.only(
        top: 80,
        left: 30,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => provider.flipList(),
            child: CircleAvatar(
              child: Icon(
                Icons.list,
                color: values.taskCatThemeColor,
              ),
              backgroundColor: Colors.white,
              radius: 30.0,
            ),
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
            '$numTasks tasks',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
