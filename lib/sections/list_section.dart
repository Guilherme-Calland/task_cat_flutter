import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/screens/entry_screen.dart';
import 'package:task_cat/shared_data/task_cat_shared_data.dart';
import 'package:task_cat/widgets/task_cat_avatar.dart';
import 'package:task_cat/widgets/task_cat_introduction.dart';
import 'package:task_cat/widgets/task_cat_slidable_button.dart';

class ListSection extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Consumer<TaskCatSharedData>(
          builder: (_, data, __) {
            if (!data.hasInitialized) {
              data.readTasks();
            }
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 18, right: 18, left: 18),
                  child: ReorderableListView.builder(
                    itemCount: data.taskList.length,
                    itemBuilder: (_, int inIndex) {
                      Task taskOnIndex = data.taskList[inIndex];
                      return GestureDetector(
                        key: ValueKey(taskOnIndex.id),
                        onDoubleTap: () => _goToEditScreen(inContext, taskOnIndex),
                        onTap: () => data.deleteTask(taskOnIndex),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(taskOnIndex.name ?? ''),
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      );
                    },
                    onReorder: (int oldIndex, int newIndex) => _onReorder(oldIndex, newIndex, data),
                  ),
                ),
                Positioned(
                  child: Row(
                    children: [
                      data.playTextAnimation
                          ? TaskCatIntroduction(
                              callback: () => data.finishTextAnimation(),
                            )
                          : Container(width: 0),
                      TaskCatAvatar(
                        image: data.taskCatAvatar,
                        callback: () => !data.playTextAnimation
                            ? data.beginTextAnimation()
                            : data.finishTextAnimation(),
                      ),
                    ],
                  ),
                  bottom: 12,
                  right: 8,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onReorder(int firstIndex, int secondIndex, TaskCatSharedData data) {
    int index1 = firstIndex;
    int index2 = secondIndex;
    List tempList = data.taskList;
    if (firstIndex < secondIndex) {
      index2 -= 1;
      String tempName = tempList[index1].name;
      for (int i = index1; i < index2; i++) {
        tempList[i].name = tempList[i + 1].name;
        data.updateTask(tempList[i], writeOnly: true);
      }
      tempList[index2].name = tempName;
      data.updateTask(tempList[index2]);
    } else {
      String tempName = tempList[index2].name;
      tempList[index2].name = tempList[index1].name;
      data.updateTask(tempList[index2], writeOnly: true);
      for(int i = index1; i > index2 + 1; i--){
        tempList[i].name = tempList[i - 1].name;
        data.updateTask(tempList[i], writeOnly: true);
      }
      tempList[index2 + 1].name = tempName;
      data.updateTask(tempList[index2 + 1]);
    }
  }

  void _goToEditScreen(BuildContext inContext, Task task){
    utils.pushScreen(
        inContext, EntryScreen(task: task));
  }
}
