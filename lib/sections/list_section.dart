import 'package:flutter/material.dart';

class ListSection extends StatelessWidget {
  @override
  Widget build(_) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(top: 18, right: 18, left: 18),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, int inIndex){
                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('task $inIndex'),
                        ),
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
