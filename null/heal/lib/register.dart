import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';
import 'package:heal/step/step1.dart';

class register extends StatefulWidget {
  @override
  _register createState() => _register();
}

class _register extends State<register> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {}
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: blue2, width: 6),
                ),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text("สมัครสมาชิก",
                          style: GoogleFonts.mitr(fontSize: 32)),
                      Container(
                          margin: EdgeInsets.only(top: 20, right: 50, left: 50),
                          padding: EdgeInsets.only(left: 20),
                          color: Colors.grey[200],
                          child: TextFormField(
                            validator: MultiValidator([
                              EmailValidator(errorText: "email ไม่ถูกต้อง"),
                              RequiredValidator(errorText: "กรุณากรอก email")
                            ]),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ("Email"),
                                hintStyle: GoogleFonts.mitr(
                                    fontSize: 20, color: Colors.grey)),
                            keyboardType: TextInputType.emailAddress,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 20, right: 50, left: 50),
                          padding: EdgeInsets.only(left: 20),
                          color: Colors.grey[200],
                          child: TextFormField(
                            validator: RequiredValidator(
                                errorText: "กรุณากรอก password"),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: ("Password"),
                                hintStyle: GoogleFonts.mitr(
                                    fontSize: 20, color: Colors.grey)),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: ElevatedButton(
                          child: Text(
                            "สมัคร",
                            style: GoogleFonts.mitr(
                                fontSize: 20,
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              _formkey.currentState.save();
                              try {
                                await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                        email: this.email,
                                        password: this.password)
                                    .then((value) {
                                  FirebaseFirestore.instance
                                      .collection("user")
                                      .doc(this.email)
                                      .set({'email': this.email});
                                  Fluttertoast.showToast(
                                      msg: "สร้างบัญชีสำเร็จ",
                                      gravity: ToastGravity.CENTER);
                                  Timer(const Duration(milliseconds: 3000), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                step1(this.email)));
                                  });
                                });
                              } on FirebaseAuthException catch (e) {
                                Fluttertoast.showToast(
                                    msg: e.message.toString(),
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 10);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: blue2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        });
  }
}
