import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/shared_data/task_cat_shared_data.dart';
import 'package:task_cat/widgets/task_cat_button.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    return Consumer<TaskCatSharedData>(
      builder: (_, data, __) {
        return Scaffold(
          body: Container(
            margin: EdgeInsets.only(top: 70, right: 30, left: 30),
            padding: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
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
                  onChanged: (String inValue){
                    data.setTaskBeingEdited( Task(name: inValue) );
                  },
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
                      inOnPressed: () async{
                        _isNewTask(data) ?
                            _saveTask(inContext, data) : (){} ;
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
  
  _saveTask(BuildContext inContext, TaskCatSharedData data) async {
    final newTask = data.taskBeingEdited;
    if(newTask.name == '') return;
    Map<String, String?> rawData = {'name': newTask.name};
    int? result = await values.database.create(rawData);
    print('task of id $result was created');
    await _backToHomeScreen(inContext, data);
  }

  bool _nameFieldIsEmpty(Task task) => task.name == '';

  Future<void> _backToHomeScreen(BuildContext inContext, TaskCatSharedData data) async {
    utils.hideKeyboard(inContext);
    await utils.sleep(milliseconds: 500);
    data.setStackIndex(0);
  }

  bool _isNewTask(TaskCatSharedData data) => data.taskBeingEdited.id == null;
}
