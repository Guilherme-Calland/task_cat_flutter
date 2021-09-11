import 'package:flutter/cupertino.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/resources.dart' as res;
import 'package:task_cat/res/values.dart' as values;

class TaskCatSharedData extends ChangeNotifier{

  bool hasInitialized = false;
  var taskCatAvatar = res.taskCatRegular;
  List<Task> taskList = [];
  String order = 'ASC';

  createTask(Task task) async {
    Map<String, dynamic> rawData = task.taskToMap();
    int? result = await values.database.create(rawData);
    print('created task of id $result');
    taskCatAvatar = res.taskCatRegular;
    readTasks();
  }

  readTasks({bool? isDeleting}) async{
    hasInitialized = true;
    List rawData = await values.database.read(order);
    List<Task> tempTaskList = [];
    rawData.forEach((element) {
      Task tempTask = Task.mapToTask(element);
      tempTaskList.add(tempTask);
    });
    taskList = tempTaskList;

    if(taskList.isEmpty){
      taskCatAvatar =
          isDeleting != null ?
              res.taskCatVeryHappy : res.taskCatCatsplaining;
    }

    notifyListeners();
  }

  updateTask(Task inTask) async {
    Map <String, dynamic> rawData = inTask.taskToMap();
    int? result = await values.database.update(rawData);
    print('$result task updated');
    taskCatAvatar = res.taskCatRegular;
    readTasks();
  }

  deleteTask(Task inTask) async {
    int? result = await values.database.delete(inTask.id ?? 1);
    print('deleted $result task');
    taskCatAvatar = res.taskCatHappy;
    readTasks(isDeleting: true);
  }

  void flipList(){
    order = (order == 'ASC') ?
        'DESC' : 'ASC';
  }
}