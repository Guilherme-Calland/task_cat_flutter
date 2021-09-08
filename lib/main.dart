import 'package:flutter/material.dart';

void main() => runApp(TaskCat());

class TaskCat extends StatelessWidget{
    @override
    Widget build(_){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.black87,
                textTheme: TextTheme(
                    bodyText2: TextStyle(
                        color: Colors.white,
                    ),
                ),
            ),
            home: Scaffold(
                body: Center(
                    child: Text(
                        'TaskCat',
                        style: TextStyle(fontSize: 40),
                    ),
                ),
            ),
        );
    }
}