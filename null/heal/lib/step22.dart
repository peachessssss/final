// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:heal/step/summary.dart';
// import 'package:syncfusion_flutter_sliders/sliders.dart';

// // ignore: must_be_immutable
// class step2 extends StatefulWidget {
//   String email;
//   step2(this.email);
//   @override
//   _step2 createState() => _step2(this.email);
// }

// class _step2 extends State<step2> {
//   double _value = 70;
//   var email;
//   _step2(this.email);
//   @override
//   Widget build(BuildContext context) {
//     return new StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('user')
//             .doc(this.email)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return new Text("Loading");
//           }
//           var userDocument = snapshot.data;
//           var caltdee = userDocument["TDEE"].toString();
//           var caltdee2 = int.parse(caltdee);
//           return Scaffold(
//               resizeToAvoidBottomInset: false,
//               body: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Color(0xFFDFE9AC), width: 10),
//                 ),
//                 child: new Column(children: [
//                   new Container(
//                     padding: EdgeInsets.only(left: 10.0),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xFF97BE11), width: 3),
//                         borderRadius: BorderRadius.circular(10)),
//                   ),
//                   //TextField น้ำหนัก
//                   new Container(
//                     padding: const EdgeInsets.only(
//                         top: 150.0, left: 50.0, right: 50.0),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   new Container(
//                     child: SfSlider(
//                       value: _value,
//                       min: 0.0,
//                       max: 100.0,
//                       interval: 50,
//                       showLabels: true,
//                       onChanged: (newvalue) {
//                         setState(() {
//                           _value = newvalue;
//                         });
//                       },
//                     ),
//                     padding: const EdgeInsets.only(left: 50.0, right: 50.0),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   new Container(
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => summary()));
//                         // FirebaseFirestore.instance
//                         //     .collection("user")
//                         //     .doc(this.email)
//                         //     .update({"Tdee": this.tdee});
//                       },
//                       child: Text(
//                         "ถัดไป",
//                         style: GoogleFonts.mitr(
//                             fontSize: 30,
//                             textStyle: TextStyle(color: Colors.white)),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                           primary: Color(0xFF97BE11),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 30, vertical: 10),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0))),
//                     ),
//                   ),
//                 ]),
//               ));
//         });
//   }
// }
