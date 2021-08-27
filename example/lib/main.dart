import 'package:angle_horizontal_listview/angle_horizontal_listview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            child: AngleListView(
              builder: (index) => Container(
                color: Colors.red,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Text(
                  '$index.item',
                ),
              ),
              jumpRange: 2,
              itemCount: 10,
            ),
          ),
        ),
      ),
    );
  }
}
