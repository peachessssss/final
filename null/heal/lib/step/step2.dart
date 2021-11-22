import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';
import 'package:heal/step/summary.dart';

// ignore: must_be_immutable
class slider extends StatefulWidget {
  String email;
  slider(this.email);
  @override
  _slider createState() => _slider(this.email);
}

class _slider extends State<slider> {
  var email;
  _slider(this.email);
  String day2 = "";
  int day;
  Color hint1 = Colors.transparent;
  Color hint2 = Colors.transparent;
  Color buttoninc = blue1;
  Color buttondec = blue1;
  Color textinc = Colors.black;
  Color textdec = Colors.black;
  int tdee2;
  bool inc = false;
  bool dec = false;
  bool wcal = true;
  int level = 10;
  String wtarget = "";
  int weight2;
  int weight3;
  int protein;
  int carp;
  int fat;
  // var cweight;
  @override
  Widget build(BuildContext context) {
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(this.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          var tdee = userDocument["TDEE"].toString();
          var weight1 = userDocument["น้ำหนัก"].toString();
          var tdeecal = int.parse(tdee);
          var weight1cal = int.parse(weight1);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                border: Border.all(color: blue2, width: 6),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("เป้าหมายของคุณ?",
                        style: GoogleFonts.mitr(fontSize: 20)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttoninc = blue4;
                            textinc = Colors.white;
                            buttondec = blue1;
                            textdec = Colors.black;
                            wcal = false;
                            inc = true;
                            dec = false;
                            if (tdee2 == null) {
                              tdee2 = (tdeecal * 1.2).round();
                              hint1 = Colors.black;
                            }
                            if (inc == true) {
                              if (level == 0) {
                                tdee2 = (tdeecal * 1.1).round();
                              }
                              //กลาง
                              if (level == 10) {
                                tdee2 = (tdeecal * 1.2).round();
                              }
                              if (level == 20) {
                                tdee2 = (tdeecal * 1.4).round();
                              }
                            }
                          });
                        },
                        child: Text(
                          "เพิ่มน้ำหนัก",
                          style: GoogleFonts.mitr(
                              fontSize: 20,
                              textStyle: TextStyle(color: textinc)),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttoninc,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            buttondec = blue4;
                            textdec = Colors.white;
                            buttoninc = blue1;
                            textinc = Colors.black;
                            wcal = false;
                            dec = true;
                            inc = false;
                            if (tdee2 == null) {
                              tdee2 = (tdeecal * 0.8).round();
                              hint1 = Colors.black;
                            }
                            if (dec == true) {
                              if (level == 0) {
                                tdee2 = (tdeecal * 0.9).round();
                              }
                              if (level == 10) {
                                tdee2 = (tdeecal * 0.8).round();
                              }
                            }
                            if (level == 20) {
                              tdee2 = (tdeecal * 0.6).round();
                            }
                          });
                        },
                        child: Text(
                          "ลดน้ำหนัก",
                          style: GoogleFonts.mitr(
                              fontSize: 20,
                              textStyle: TextStyle(color: textdec)),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: buttondec,
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "เลือกระดับการเพิ่ม/ลดน้ำหนัก",
                      style: GoogleFonts.mitr(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      if (level == 0)
                        Text(
                          "เบา",
                          style: GoogleFonts.mitr(fontSize: 35.0),
                        ),
                      if (level == 10)
                        Text(
                          "กลาง",
                          style: GoogleFonts.mitr(fontSize: 35.0),
                        ),
                      if (level == 20)
                        Text(
                          "หนัก",
                          style: GoogleFonts.mitr(fontSize: 35.0),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Slider(
                    value: level.toDouble(),
                    min: 0,
                    max: 20,
                    divisions: 2,
                    activeColor: blue2,
                    onChanged: (double value) {
                      if (inc == false && dec == false) {
                        setState(() {
                          level = 10;
                        });
                      } else {
                        setState(() {
                          level = value.round();
                          if (level == 0) {
                            if (inc == true) {
                              tdee2 = (tdeecal * 1.1).round();
                            } else if (dec == true) {
                              tdee2 = (tdeecal * 0.9).round();
                            }
                            if (weight3 != null) {
                              day = ((weight3 / 0.25) * 7).round();
                              day2 = day.toString();
                            }
                          }
                          //กลาง
                          if (level == 10) {
                            if (inc == true) {
                              tdee2 = (tdeecal * 1.2).round();
                            } else if (dec == true) {
                              tdee2 = (tdeecal * 0.8).round();
                            }
                            if (weight3 != null) {
                              day = ((weight3 / 0.5) * 7).round();
                              day2 = day.toString();
                            }
                          }
                          if (level == 20) {
                            if (inc == true) {
                              tdee2 = (tdeecal * 1.4).round();
                            } else if (dec == true) {
                              tdee2 = (tdeecal * 0.6).round();
                            }
                            if (weight3 != null) {
                              day = ((weight3 / 1.0) * 7).round();
                              day2 = day.toString();
                            }
                          }
                        });
                      }
                    },
                  ),
                  SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "TDEE ที่ต้องการในแต่ละวัน",
                      style: GoogleFonts.mitr(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: tdee2.toString(),
                        hintStyle: TextStyle(color: hint1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("เป้าหมายน้ำหนัก",
                        style: GoogleFonts.mitr(fontSize: 20)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //เป้าหมายน้ำหนัก
                  TextFormField(
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'กรุณากรอกน้ำหนัก';
                      //   } else if (value.isNotEmpty) {
                      //     cweight = int.parse(value);
                      //     if (cweight <= 20 || cweight >= 200) {
                      //       return 'ไม่อยู่ในช่วงน้ำหนักที่กำหนด';
                      //     }
                      //   }
                      //   return null;
                      // },
                      onChanged: (val) {
                        setState(() => wtarget = val);
                        hint2 = Colors.black;
                        weight2 = int.parse(wtarget);
                        weight3 = (weight1cal - weight2).abs();
                        if (level == 0) {
                          day = ((weight3 / 0.25) * 7).round();
                          day2 = day.toString();
                        }
                        if (level == 10) {
                          day = ((weight3 / 0.5) * 7).round();
                          day2 = day.toString();
                        }
                        if (level == 20) {
                          day = ((weight3 / 1.0) * 7).round();
                          day2 = day.toString();
                        }
                      },
                      keyboardType: TextInputType.number,
                      readOnly: wcal,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "จำนวนวันที่เหลือ",
                      style: GoogleFonts.mitr(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: (day2.toString() + " วัน"),
                        hintStyle: TextStyle(color: hint2),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: blue4,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      protein = (tdee2 * 0.3).round();
                      carp = (tdee2 * 0.4).round();
                      fat = (tdee2 * 0.3).round();
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(this.email)
                          .update({
                        'day': this.day,
                        'ไขมันคำนวณ': this.fat,
                        'คาร์โบไฮเดรทคำนวณ': this.carp,
                        'โปรตีนคำนวณ': this.protein,
                        'TDEEคำนวณ': this.tdee2,
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => summary(this.email)));
                    },
                    child: Text(
                      "สรุปผล",
                      style: GoogleFonts.mitr(
                          fontSize: 20,
                          textStyle: TextStyle(color: Colors.white)),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: blue2,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  )
                ],
              ),
            ),
          );
        });
  }
}
