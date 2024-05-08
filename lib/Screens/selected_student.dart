import 'package:flutter/material.dart';
import 'package:mytodoapp/Models/postmodel.dart';

class SelectedStudent extends StatelessWidget {
  final PostModel studentData;
  const SelectedStudent({super.key, required this.studentData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.yellow,
              child: Text(
                "Name: ${studentData.name}",
                style: TextStyle(fontSize: 40),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Card(
              color: Colors.yellow,
              child: Text(
                "Todo: ${studentData.body}",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
