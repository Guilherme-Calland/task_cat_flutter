import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/shared_data/task_cat_shared_data.dart';
import 'package:task_cat/widgets/task_cat_button.dart';

class EntryScreen extends StatelessWidget {
  final Task? task;
  final _textController = TextEditingController();
  EntryScreen({this.task}){
    if(!_isNewTask()){
      _textController.text = this.task!.name!;
    }
  }

  bool _isNewTask() => this.task == null;


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
                Text( _isNewTask() ?
                  'New Task' : 'Edit Task',
                  style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w700,
                      color: values.taskCatThemeColor),
                ),
                TextField(
                  autofocus: true,
                  controller: _textController,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: values.taskCatThemeColor,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    border: InputBorder.none,
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
                      inOnPressed: () async{
                        await _backToHomeScreen(inContext);
                      },
                    ),
                    TaskCatButton(
                      inText: _isNewTask() ?
                      'Save' : 'Update',
                      inOnPressed: () async{
                        if(_textController.text == '') return;
                        String taskName = _textController.text;
                        _isNewTask() ?
                          create(taskName, data) : update(taskName, data);
                        await _backToHomeScreen(inContext);
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

  void update(String taskName, TaskCatSharedData data) {
    this.task!.name = taskName;
    data.updateTask(this.task!);
  }

  void create(String taskName, TaskCatSharedData data) {
    final newTask = Task(taskName);
    data.createTask(newTask);
  }

  Future<void> _backToHomeScreen(BuildContext inContext) async {
    utils.hideKeyboard(inContext);
    await utils.sleep(milliseconds: 400);
    Navigator.pop(inContext);
  }

}
