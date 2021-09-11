import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/model/task.dart';
import 'package:task_cat/res/utils.dart' as utils;
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/screens/entry_screen.dart';
import 'package:task_cat/shared_data/task_cat_shared_data.dart';

class ListSection extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Consumer<TaskCatSharedData>(
          builder: (_, data, __) {
            data.readTasks();
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 18, right: 18, left: 18),
                  child: ListView.builder(
                    itemCount: data.taskList.length,
                    itemBuilder: (_, int inIndex) {
                      Task taskOnIndex = data.taskList[inIndex];
                      return Container(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(taskOnIndex.name ?? ''),
                              onTap: (){
                                data.deleteTask( taskOnIndex );
                              },
                              onLongPress: (){
                                utils.pushScreen(inContext, EntryScreen(task: taskOnIndex));
                              },
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {
                      utils.pushScreen(inContext, EntryScreen());
                    },
                    child: data.taskCatAvatar,
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
