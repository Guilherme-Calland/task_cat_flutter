import 'package:flutter/cupertino.dart';
import 'package:task_cat/res/resources.dart' as res;

class TaskCatSharedData extends ChangeNotifier{

  int _stackIndex = 0;

  int get stackIndex => _stackIndex;

  var taskCatAvatar = res.taskCatRegular;

  void setStackIndex(int index){
    _stackIndex = index;
    notifyListeners();
  }

}