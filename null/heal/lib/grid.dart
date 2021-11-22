import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  @override
  _grid createState() => _grid();
}

class _grid extends State<grid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(100.0),
          crossAxisSpacing: 100,
          crossAxisCount: 2,
          children: [Text("1"), Text("2"), Text("3"), Text("4")],
        ),
      ),
    );
  }
}
