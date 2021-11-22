import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';
import 'package:heal/food.dart';
import 'package:heal/css/list.dart';

// ignore: must_be_immutable
class addfood extends StatefulWidget {
  @override
  _addfood createState() => _addfood();
}

class _addfood extends State<addfood> {
  String name = "";
  String calories = "";
  String protein = "";
  String carp = "";
  String fat = "";
  var valueChoose;
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: blue2,
          centerTitle: true,
          title: const Text('เพิ่มอาหาร'),
        ),
        body: Container(
            margin: EdgeInsets.all(20.0),
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("ข้อมูลทั่วไป",
                          style: GoogleFonts.mitr(fontSize: 18)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                        onChanged: (val) {
                          setState(() => name = val);
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "ชื่ออาหาร",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: blue4,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: blue4,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: blue4, width: 1.7),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: Icon(
                          EvilIcons.chevron_down,
                          color: blue4,
                          size: 60,
                        ),
                        hint: Text('ประเภทอาหาร'),
                        value: valueChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueChoose = newValue;
                          });
                        },
                        items: type.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem,
                                style: GoogleFonts.mitr(
                                    fontSize: 18, fontWeight: FontWeight.w300)),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //น้ำหนัก,
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("ปริมาณสารอาหาร",
                          style: GoogleFonts.mitr(fontSize: 18)),
                    ),
                    Expanded(
                      child: GridView.count(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        crossAxisSpacing: 12.0,
                        childAspectRatio: 2,
                        crossAxisCount: 2,
                        children: <Widget>[
                          TextFormField(
                              onChanged: (val) {
                                setState(() => calories = val);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "แคลอรี่(กิโลแคลอรี่)",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: blue4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: blue4),
                                ),
                              )),
                          TextFormField(
                              onChanged: (val) {
                                setState(() => protein = val);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "โปรตีน(กรัม)",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: blue4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: blue4),
                                ),
                              )),
                          Container(
                              width: 10,
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => carp = val);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "คาร์โบไฮเดรท(กรัม)",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: blue4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: blue4),
                                  ),
                                ),
                              )),
                          Container(
                              width: 80,
                              child: TextFormField(
                                onChanged: (val) {
                                  setState(() => fat = val);
                                },
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "ไขมัน(กรัม)",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: blue4),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(color: blue4),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 35),
                        child: ElevatedButton(
                          child: Text(
                            "ถัดไป",
                            style: GoogleFonts.mitr(
                                fontSize: 20,
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                          onPressed: () async {
                            print(valueChoose);
                            FirebaseFirestore.instance
                                .collection("อาหาร")
                                .doc(this.name)
                                .set({
                              'ชื่อ': this.name,
                              'หมวดหมู่่': this.valueChoose,
                              'แคลอรี่': this.calories,
                              'โปรตีน': this.protein,
                              'คาร์โบไฮเดรท': this.carp,
                              'ไขมัน': this.fat
                            });
                            Timer(const Duration(milliseconds: 3000), () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => food()));
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              primary: blue2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        )),
                  ],
                ))));
  }
}
