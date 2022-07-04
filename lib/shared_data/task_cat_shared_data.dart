import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/resources.dart' as res;
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;

class TaskCatSharedData extends ChangeNotifier{

  bool hasInitialized = false;
  var taskCatAvatar = res.taskCatRegular;
  List<Task> taskList = [];
  String? order;
  bool? playTextAnimation;

  TaskCatSharedData(){
    getPreferences();
  }

  getPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    order = prefs.getString('listOrder');
    if(order == null){
      order = 'ASC';
      await prefs.setString('listOrder', 'ASC');
    }

    playTextAnimation = prefs.getBool('firstTimeUsingApp');
    if(playTextAnimation == null){
      beginTextAnimation();
      await prefs.setBool('firstTimeUsingApp', false);
    }
    notifyListeners();
  }

  createTask(Task task) async {
    Map<String, dynamic> rawData = task.taskToMap();
    int? result = await values.database.create(rawData);
    print('created task of id $result');
    taskCatAvatar = res.taskCatRegular;
    readTasks();
  }

  readTasks({bool? isDeleting}) async{
    if(!hasInitialized){
      final prefs = await SharedPreferences.getInstance();
      order = prefs.getString('listOrder');
      if(order == null){
        order = 'ASC';
        await prefs.setString('listOrder', 'ASC');
      }
    }
    hasInitialized = true;
    List rawData = await values.database.read(order ?? 'ASC');
    List<Task> tempTaskList = [];
    rawData.forEach((element) {
      Task tempTask = Task.mapToTask(element);
      tempTaskList.add(tempTask);
    });
    taskList = tempTaskList;

    if(taskList.isEmpty){
      if(isDeleting != null){
        taskCatAvatar = res.taskCatVeryHappy;
      }
    }
    notifyListeners();
  }

  updateTask(Task inTask, {bool? writeOnly}) async {
    if(writeOnly == null){
      writeOnly = false;
    }
    Map <String, dynamic> rawData = inTask.taskToMap();
    int? result = await values.database.update(rawData);
    if(!writeOnly) {
      print('$result task updated');
      taskCatAvatar = res.taskCatRegular;
      readTasks();
    }
  }

  deleteTask(Task inTask) async {
    int? result = await values.database.delete(inTask.id ?? 1);
    print('deleted $result task');
    taskCatAvatar = res.taskCatHappy;
    readTasks(isDeleting: true);
  }

  void flipList() async{
    order = (order == 'ASC') ?
        'DESC' : 'ASC';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('listOrder', order ?? 'ASC');
    readTasks();
  }

  void finishTextAnimation() async{
    playTextAnimation = false;
    notifyListeners();
    await utils.sleep(milliseconds: 1000);
    taskCatAvatar = res.taskCatHappy;
    notifyListeners();
  }

  void beginTextAnimation() async{
    playTextAnimation = true;
    notifyListeners();
    await utils.sleep(milliseconds: 2000);
    taskCatAvatar = res.taskCatCatsplaining;
    notifyListeners();
  }
}