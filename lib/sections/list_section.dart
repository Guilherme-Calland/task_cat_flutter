import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/res/values.dart' as values;
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
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 18, right: 18, left: 18),
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, int inIndex) {
                      return Container(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('hello number $inIndex'),
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
                      data.setStackIndex(1);
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
