import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  @override
  _Countdown createState() => _Countdown();
}

class _Countdown extends State<Countdown> {
  Duration countdownduration = Duration(minutes: 1);
  Duration duration = Duration();
  Timer timer;
  bool isCountdown = true;
  int maxsec = 120;
  Route route = MaterialPageRoute(builder: (context) => Countdown());

  @override
  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  void addTime() {
    // final addseconds = 1;
    setState(() {
      final seconds = maxsec--;
      // final seconds = 0;
      duration = Duration(seconds: seconds);
      // if (seconds < 0) {
      //   timer.cancel();
      // } else {
      //   duration = Duration(seconds: seconds);
      // }
      if (route.isCurrent == false) {
        print("$seconds");
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void reset() {
    if (isCountdown) {
      setState(() => duration = countdownduration);
    }
    setState(() => duration = Duration());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Scaffold(
        body: Center(
            child: Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('$hours',
                style: TextStyle(fontSize: 80, color: Colors.white))),
        SizedBox(
          width: 8,
        ),
        Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('$minutes',
                style: TextStyle(fontSize: 80, color: Colors.white))),
        SizedBox(
          width: 8,
        ),
        Container(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('$seconds',
                style: TextStyle(fontSize: 80, color: Colors.white)))
      ]),
    )));
  }
}
