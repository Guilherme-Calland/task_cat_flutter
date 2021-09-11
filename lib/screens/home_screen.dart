import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_cat/database/database_helper.dart';
import 'package:task_cat/res/values.dart' as values;
import 'package:task_cat/sections/list_section.dart';
import 'package:task_cat/sections/title_section.dart';
import 'package:task_cat/shared_data/task_cat_shared_data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSection(),
            Expanded(
              child: ListSection(),
            )
          ],
        ),
      ),
    );
  }
}
