// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heal/color.dart';
// import 'package:heal/step/summary.dart';

// class slider extends StatefulWidget {
//   String email;
//   slider(this.email);
//   @override
//   _slider createState() => _slider(this.email);
// }

// class _slider extends State<slider> {
//   var email;
//   _slider(this.email);
//   int weight1 = 60;
//   String day2 = "";
//   double day;
//   double week;
//   Color hint1 = Colors.transparent;
//   Color hint2 = Colors.transparent;
//   double tdee = 1000;
//   double tdee2;
//   bool inc = false;
//   bool dec = false;
//   int level = 10;
//   String weight = "";
//   int weight2;
//   int weight3;
//   var cweight;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: green1, width: 6),
//         ),
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text("เป้าหมายของคุณ?",
//                   style: GoogleFonts.mitr(fontSize: 20)),
//             ),
//             SizedBox(height: 5),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     inc = true;
//                     dec = false;
//                     hint1 = Colors.black;
//                   },
//                   child: Text(
//                     "เพิ่มน้ำหนัก",
//                     style: GoogleFonts.mitr(
//                         fontSize: 20,
//                         textStyle: TextStyle(color: Colors.white)),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       primary: blue4,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0))),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     dec = true;
//                     inc = false;
//                     hint1 = Colors.black;
//                   },
//                   child: Text(
//                     "ลดน้ำหนัก",
//                     style: GoogleFonts.mitr(
//                         fontSize: 20,
//                         textStyle: TextStyle(color: Colors.white)),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                       primary: blue4,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0))),
//                 )
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               "เลือกระดับ",
//               style: GoogleFonts.mitr(fontSize: 20.0),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.baseline,
//               textBaseline: TextBaseline.alphabetic,
//               children: <Widget>[
//                 if (level == 0)
//                   Text(
//                     "เบา",
//                     style: GoogleFonts.mitr(fontSize: 40.0),
//                   ),
//                 if (level == 10)
//                   Text(
//                     "กลาง",
//                     style: GoogleFonts.mitr(fontSize: 40.0),
//                   ),
//                 if (level == 20)
//                   Text(
//                     "หนัก",
//                     style: GoogleFonts.mitr(fontSize: 40.0),
//                   ),
//               ],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Slider(
//               value: level.toDouble(),
//               min: 0,
//               max: 20,
//               divisions: 2,
//               activeColor: green1,
//               onChanged: (double value) {
//                 setState(() {
//                   level = value.round();
//                   if (level == 0) {
//                     if (inc == true) {
//                       tdee2 = tdee * 1.1;
//                     } else if (dec == true) {
//                       tdee2 = tdee * 0.9;
//                     }
//                     if (weight3 != null) {
//                       day = weight3 / 0.25;
//                       day2 = day.toString();
//                     }
//                   }
//                   if (level == 10) {
//                     if (inc == true) {
//                       tdee2 = tdee * 1.2;
//                     } else if (dec == true) {
//                       tdee2 = tdee * 0.8;
//                     }
//                     if (weight3 != null) {
//                       day = weight3 / 0.5;
//                       day2 = day.toString();
//                     }
//                   }
//                   if (level == 20) {
//                     if (inc == true) {
//                       tdee2 = tdee * 1.4;
//                     } else if (dec == true) {
//                       tdee2 = tdee * 0.6;
//                     }
//                     if (weight3 != null) {
//                       day = weight3 / 1.0;
//                       day2 = day.toString();
//                     }
//                   }
//                 });
//               },
//             ),
//             SizedBox(height: 5),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "TDEE ที่ต้องการในแต่ละวัน",
//                 style: GoogleFonts.mitr(fontSize: 20.0),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   hintText: tdee2.toString(),
//                   hintStyle: TextStyle(color: hint1),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                 )),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text("เป้าหมายน้ำหนัก",
//                   style: GoogleFonts.mitr(fontSize: 20)),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             //เป้าหมายน้ำหนัก
//             TextFormField(
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'กรุณากรอกน้ำหนัก';
//                   } else if (value.isNotEmpty) {
//                     cweight = int.parse(value);
//                     if (cweight <= 20 || cweight >= 200) {
//                       return 'ไม่อยู่ในช่วงน้ำหนักที่กำหนด';
//                     }
//                   }
//                   return null;
//                 },
//                 onChanged: (val) {
//                   setState(() => weight = val);
//                   hint2 = Colors.black;
//                   weight2 = int.parse(weight);
//                   weight3 = (weight1 - weight2).abs();
//                   if (level == 0) {
//                     day = weight3 / 0.25;
//                     day2 = day.toString();
//                     print(day2);
//                   }
//                   if (level == 10) {
//                     day = weight3 / 0.5;
//                     day2 = day.toString();
//                     print(day2);
//                   }
//                   if (level == 20) {
//                     day = weight3 / 1.0;
//                     day2 = day.toString();
//                     print(day2);
//                   }
//                 },
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                 )),
//             SizedBox(
//               height: 5,
//             ),
//             Container(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "จำนวนวันที่เหลือ",
//                 style: GoogleFonts.mitr(fontSize: 20.0),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   hintText: day2.toString(),
//                   hintStyle: TextStyle(color: hint2),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(25.0),
//                     borderSide: BorderSide(
//                       color: blue4,
//                     ),
//                   ),
//                 )),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: Text(
//                 "สรุปผล",
//                 style: GoogleFonts.mitr(
//                     fontSize: 30, textStyle: TextStyle(color: Colors.white)),
//               ),
//               style: ElevatedButton.styleFrom(
//                   primary: green1,
//                   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
