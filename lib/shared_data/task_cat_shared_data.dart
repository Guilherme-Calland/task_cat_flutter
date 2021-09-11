import 'package:flutter/cupertino.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/resources.dart' as res;
import 'package:task_cat/res/values.dart' as values;

class TaskCatSharedData extends ChangeNotifier{

  int stackIndex = 0;
  var taskCatAvatar = res.taskCatRegular;
  List<Task> taskList = [];

  void setStackIndex(int index){
    stackIndex = index;
  }

  createTask(Task task) async {
    Map<String, dynamic> rawData = task.taskToMap();
    int? result = await values.database.create(rawData);
    print('created task of id $result');
    readTasks();
  }

  readTasks() async{
    List rawData = await values.database.read();
    List<Task> tempTaskList = [];
    rawData.forEach((element) {
      Task tempTask = Task.mapToTask(element);
      tempTaskList.add(tempTask);
    });
    taskList = tempTaskList;
    notifyListeners();
  }

  updateTask(Task inTask) async {
    Map <String, dynamic> rawData = inTask.taskToMap();
    int? result = await values.database.update(rawData);
    print('$result task updated');
    readTasks();
  }

  deleteTask(Task inTask) async {
    int? result = await values.database.delete(inTask.id ?? 1);
    print('deleted $result task');
    readTasks();
  }

}