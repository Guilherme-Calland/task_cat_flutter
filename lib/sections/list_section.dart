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
                      return Slidable(
                        key: ValueKey(inIndex),
                        actionPane: SlidableScrollActionPane(),
                        actions: [
                          TaskCatSlidableButton(
                            iconData: Icons.edit,
                            onPressed: () {
                              print('time to edit');
                            },
                          ),
                          TaskCatSlidableButton(
                            iconData: Icons.delete,
                            onPressed: (){
                              print('time to delete');
                            },
                          )
                        ],
                        child: Container(
                          padding: EdgeInsets.all(4),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(taskOnIndex.name ?? ''),
                                onTap: () {
                                  data.deleteTask(taskOnIndex);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }, onReorder: (int oldIndex, int newIndex) {},
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
                        callback: () =>
                        !data.playTextAnimation ?
                        data.beginTextAnimation() : data.finishTextAnimation(),
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
}

