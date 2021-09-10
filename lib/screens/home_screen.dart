import 'package:flutter/material.dart';
import 'package:task_cat/sections/list_section.dart';
import 'package:task_cat/sections/title_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(_) {
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
