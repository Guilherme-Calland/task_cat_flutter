import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TaskCatIntroduction extends StatelessWidget {
  final Function() callback;
  TaskCatIntroduction({required this.callback});

  @override
  Widget build(BuildContext inContext) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(inContext).size.width - 124,
      padding: EdgeInsets.only(left: 24, right: 8, bottom: 8, top: 8),
      margin: EdgeInsets.only(bottom: 24),
      child: AnimatedTextKit(
        onFinished: callback,
        animatedTexts: [
          TyperAnimatedText('...',
              speed: Duration(milliseconds: 500), textAlign: TextAlign.end),
          TyperAnimatedText(
            'Welcome! I\'m the Task Cat.',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'To add a new task, just tap on me.',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'To edit a task just tap on the selected task.',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'To delete a task just double tap the selected task.',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'To change the tasks position, drag and drop the task.',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'Oh boy, I sure do like saying the word "task"!',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'task task task task!',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'Oh, and to invert the list order, just tap on the icon above the app title.',
          ),
          TyperAnimatedText(
            'To repeat the instructions, just press and hold on me!',
            speed: Duration(milliseconds: 80),
          ),
          TyperAnimatedText(
            'Miau!',
            textAlign: TextAlign.center,
            speed: Duration(milliseconds: 80),
          ),
        ],
        totalRepeatCount: 1,
      ),
    );
  }
}
