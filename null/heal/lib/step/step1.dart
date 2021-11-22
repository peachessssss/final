import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';
import 'package:heal/step/step2.dart';

// ignore: must_be_immutable
class step1 extends StatefulWidget {
  String email;
  step1(this.email);
  @override
  _step1 createState() => _step1(this.email);
}

class _step1 extends State<step1> {
  var email;
  _step1(this.email);
  Color _color = Colors.transparent;
  Color _color2 = Colors.transparent;
  Color _color3 = Colors.transparent;
  String gender = "";
  String age = "";
  String weight = "";
  String height = "";
  var cage;
  var cweight;
  var cheight;
  int bmr;
  int tdee;
  int protein;
  int carp;
  int fat;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'คำนวณ BMR & TDEE',
          style: GoogleFonts.mitr(fontSize: 24, color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              new Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: _color, width: 5),
                    color: Color(0xFF91A8D2),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _color = blue4;
                        _color2 = Colors.transparent;
                        _color3 = Colors.transparent;
                        gender = "ชาย";
                      });
                    },
                    icon: Image.asset("assets/images/male.png"),
                    iconSize: 100,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    border: Border.all(color: _color2, width: 5),
                    color: Color(0xFFF6CAC9),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        _color = Colors.transparent;
                        _color2 = blue4;
                        _color3 = Colors.transparent;
                        gender = "หญิง";
                      });
                    },
                    icon: Image.asset("assets/images/female.png"),
                    iconSize: 100,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ]),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text("อย่าลืมเลือกนะไอสัสไม่งั้นไปต่อไม่ได้",
                    style: GoogleFonts.mitr(fontSize: 12, color: _color3)),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("อายุ", style: GoogleFonts.mitr(fontSize: 15)),
              ),
              SizedBox(
                height: 5,
              ),
              //อายุ
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอายุ';
                    } else if (value.isNotEmpty) {
                      cage = int.parse(value);
                      if (cage <= 12 || cage >= 70) {
                        return 'ไม่อยู่ในช่วงอายุที่กำหนด';
                      }
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => age = val);
                  },
                  keyboardType: TextInputType.number,
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
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("น้ำหนัก", style: GoogleFonts.mitr(fontSize: 15)),
              ),
              SizedBox(
                height: 5,
              ),
              //น้ำหนัก
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกน้ำหนัก';
                    } else if (value.isNotEmpty) {
                      cweight = int.parse(value);
                      if (cweight <= 20 || cweight >= 200) {
                        return 'ไม่อยู่ในช่วงน้ำหนักที่กำหนด';
                      }
                    }
                    return null;
                  },
                  onChanged: (val) {
                    setState(() => weight = val);
                  },
                  keyboardType: TextInputType.number,
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
                height: 15,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("ส่วนสูง", style: GoogleFonts.mitr(fontSize: 15)),
              ),
              SizedBox(
                height: 5,
              ),
              //ส่วนสูง
              TextFormField(
                  // ignore: missing_return
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกส่วนสูง';
                    } else if (value.isNotEmpty) {
                      cheight = int.parse(value);
                      if (cheight <= 100 || cheight >= 200) {
                        return 'ไม่อยู่ในช่วงส่วนสูงที่กำหนด';
                      }
                    }
                  },
                  onChanged: (val) {
                    setState(() => height = val);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: blue4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(color: blue4),
                    ),
                  )),
              SizedBox(
                height: 25,
                width: double.infinity,
              ),
              ElevatedButton(
                child: Text(
                  "ถัดไป",
                  style: GoogleFonts.mitr(
                      fontSize: 20, textStyle: TextStyle(color: Colors.white)),
                ),
                onPressed: () async {
                  if (this.gender == "") {
                    setState(() {
                      _color3 = Colors.red;
                    });
                  } else if (this.gender == "ชาย" || this.gender == "หญิง") {
                    if (_formkey.currentState.validate()) {
                      _formkey.currentState.save();
                      if (this.gender == "ชาย") {
                        bmr = (66 +
                                (13.7 * this.cweight) +
                                (5 * this.cheight) -
                                (6.8 * this.cage))
                            .round();
                      } else if (this.gender == "หญิง") {
                        bmr = (665 +
                                (9.6 * this.cweight) +
                                (1.8 * this.cheight) -
                                (4.7 * this.cage))
                            .round();
                      }
                      tdee = (bmr * 1.2).round();
                      protein = (tdee * 0.3).round();
                      carp = (tdee * 0.4).round();
                      fat = (tdee * 0.3).round();
                      FirebaseFirestore.instance
                          .collection("user")
                          .doc(this.email)
                          .update({
                        'ไขมัน': this.fat,
                        'คาร์โบไฮเดรท': this.carp,
                        'โปรตีน': this.protein,
                        'TDEE': this.tdee,
                        'BMR': this.bmr,
                        'ส่วนสูง': this.cheight,
                        'น้ำหนัก': this.cweight,
                        'อายุ': this.cage,
                        'เพศ': this.gender,
                      });
                      _formkey.currentState.reset();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => slider(this.email)));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary: blue2,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
