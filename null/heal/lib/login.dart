import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:heal/clock.dart';
import 'package:heal/css/color.dart';
import 'package:heal/home.dart';
import 'package:heal/register.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:heal/step/step1.dart';
//import 'package:heal/step/summary.dart';
import 'step/summary.dart';

class login extends StatefulWidget {
  @override
  _login createState() => _login();
}

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  // ignore: missing_return
  Future<String> signInwithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}

class _login extends State<login> {
  final _formkey = GlobalKey<FormState>();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String email = " ";
  String password = "";
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
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          color: blue2,
                        ),
                      ),
                      Expanded(
                        child: Container(
                            child: Column(children: <Widget>[
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, right: 50, left: 50),
                            padding: EdgeInsets.only(left: 20),
                            color: grey1,
                            child: TextFormField(
                              controller: emailcontroller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.mitr(
                                      fontSize: 20, color: Colors.grey)),
                              keyboardType: TextInputType.emailAddress,
                              validator: MultiValidator([
                                EmailValidator(errorText: "email ไม่ถูกต้อง"),
                                RequiredValidator(errorText: "กรุณากรอก email")
                              ]),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, right: 50, left: 50),
                            padding: EdgeInsets.only(left: 20),
                            color: grey1,
                            child: TextFormField(
                              controller: passwordcontroller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: GoogleFonts.mitr(
                                      fontSize: 20, color: Colors.grey)),
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              validator: RequiredValidator(
                                  errorText: "กรุณากรอก password"),
                            ),
                          ),
                          Container(
                              child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Countdown()));
                            },
                            child: Text("Forgot Password?",
                                style: GoogleFonts.mitr(fontSize: 15)),
                          )),
                          ElevatedButton(
                            child: Text(
                              "Log in",
                              style: GoogleFonts.mitr(
                                  fontSize: 20,
                                  textStyle: TextStyle(color: Colors.white)),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                _formkey.currentState.save();
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailcontroller.text,
                                          password: passwordcontroller.text);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              summary(emailcontroller.text)));
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.message.toString(),
                                      gravity: ToastGravity.CENTER);
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
                          SizedBox(
                            height: 10,
                          ),
                          // Google Signin
                          SignInButton(Buttons.Google, onPressed: () async {
                            FirebaseService service = new FirebaseService();
                            try {
                              User user =
                                  await FirebaseAuth.instance.currentUser;
                              await service.signInwithGoogle();
                              FirebaseFirestore.instance
                                  .collection("user")
                                  .doc(user.email)
                                  .set({'email': user.email});
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => step1(user.email)));
                            } on FirebaseAuthException catch (e) {
                              Fluttertoast.showToast(
                                  msg: e.message.toString(),
                                  gravity: ToastGravity.CENTER);
                            }
                          }),
                          SignInButton(Buttons.FacebookNew,
                              onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          }),
                        ])),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              Text("Register",
                                  style: GoogleFonts.mitr(
                                      fontSize: 15, color: Colors.white)),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => register()));
                                  },
                                  child: Text(
                                    "Click",
                                    style: GoogleFonts.mitr(
                                        fontSize: 15, color: Colors.white),
                                  )),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
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
