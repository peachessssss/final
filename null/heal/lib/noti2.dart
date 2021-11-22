import 'dart:async';

import 'package:flutter/material.dart';
import 'package:heal/noti.dart';
import 'package:timezone/data/latest.dart' as tz;

class noti2 extends StatefulWidget {
  @override
  _noti2 createState() => _noti2();
}

class _noti2 extends State<noti2> {
  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Timer(Duration(milliseconds: 1000), () {
                      NotificationService().showNotification(
                          1, "water", "ถึงเวลากินน้ำแล้ว", 10);
                    });
                  });
                },
                child: Text("Show Notification")),
          ],
        ),
      ),
    );
  }
}
