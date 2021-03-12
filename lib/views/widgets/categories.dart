import 'package:flutter/material.dart';

class TaskCategories extends StatelessWidget {
  final int index;
  TaskCategories({this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: index % 2 == 0 ? Colors.green.shade400 : Colors.orange.shade400,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.green : Colors.orange,
                  shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: -20,
            left: -20,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.green : Colors.orange,
                  shape: BoxShape.circle),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  index % 2 == 0 ? Icons.fact_check : Icons.insert_drive_file,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "10 tasks",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "January 2020",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
