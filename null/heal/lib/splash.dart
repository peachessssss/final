import 'package:flutter/material.dart';
import 'dart:async';
import 'package:heal/css/color.dart';
import 'package:heal/css/image.dart';
import 'package:heal/login.dart';

class splash extends StatefulWidget {
  @override
  _splash createState() => _splash();
}

class _splash extends State<splash> {
  int test = 3000;
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: test), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [blue2, blue1],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter),
      ),
      child: Center(child: icon),
    ));
  }
}
