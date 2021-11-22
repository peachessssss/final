// import 'package:android_alarm_manager/android_alarm_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:heal/notificationHelper.dart';
// import 'package:heal/sharedPrefs.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CustomizedNotification extends StatefulWidget {
//   @override
//   _CustomizedNotificationState createState() => _CustomizedNotificationState();
// }

// class _CustomizedNotificationState extends State<CustomizedNotification> {
//   String startTime = "";
//   String endTime = "";
//   @override
//   void initState() {
//     super.initState();
//     getTime();
//   }

//   static periodicCallback() {
//     NotificationHelper().showNotificationBtweenInterval();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   height: double.infinity,
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         "Notification Start From",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         startTime,
//                         style: TextStyle(fontSize: 30),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   // getD(){
//   //   SharedPreferences.getInstance().then((value) {
//   //     var a = value.getString('dai');
//   //     print(a);
//   //   });
//   // }

//   //   Future sujan() async {
//   //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   //   sharedPreferences.setString("dai", "lado");
//   // }

//   onTimePeriodic() {
//     SharedPreferences.getInstance().then((value) async {
//       var a = value.getBool('oneTimePeriodic') ?? false;
//       if (!a) {
//         await AndroidAlarmManager.periodic(
//             Duration(minutes: 1), 0, periodicCallback);
//         onlyOneTimePeriodic();
//       } else {
//         print("Cannot run more than once");
//       }
//     });
//   }

//   getTime() {
//     SharedPreferences.getInstance().then((value) {
//       var a = value.getString('startTime');
//       var b = value.getString('endTime');
//       if (a != null && b != null) {
//         setState(() {
//           startTime = DateFormat('jm').format(DateTime.parse(a));
//           endTime = DateFormat('jm').format(DateTime.parse(b));
//         });
//       }
//     });
//   }
// }
