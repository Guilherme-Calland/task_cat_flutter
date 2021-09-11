import 'package:flutter/cupertino.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/resources.dart' as res;
import 'package:task_cat/res/values.dart' as values;

class TaskCatSharedData extends ChangeNotifier{

  int stackIndex = 0;
  var taskCatAvatar = res.taskCatRegular;
  Task taskBeingEdited = Task();
  List<Task> taskList = [];


  void setStackIndex(int index){
    stackIndex = index;
    notifyListeners();
  }

  void setTaskBeingEdited(Task inTask){
    taskBeingEdited = inTask;
    notifyListeners();
  }

  void loadData() async{
    List rawData = await values.database.read();
    List<Task> tempTaskList = [];
    rawData.forEach((element) {
      Task tempTask = Task.mapToTask(element);
      tempTaskList.add(tempTask);
    });
    taskList = tempTaskList;
    notifyListeners();
  }

}