import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';

// ignore: must_be_immutable
class summary extends StatefulWidget {
  String email;
  summary(this.email);
  @override
  _summary createState() => _summary(this.email);
}

class _summary extends State<summary> with TickerProviderStateMixin {
  var email;
  int check;
  int check2;
  int tdee2;
  List num12 = [];
  _summary(this.email);
  final List sum = ['BMR', 'TDEE', 'PROTEIN', 'CARP', 'FAT'];
  int itemnum = 5;
  alert(BuildContext context) {
    // set up the buttons
    Widget closeButton = TextButton(
        child: Text("Close"),
        onPressed: () async {
          Navigator.of(context, rootNavigator: true).pop();
        });

    // set up the AlertDialog
    if (check == 0) {
      AlertDialog alert = AlertDialog(
        title: Text("Protein"),
        content: Text("คิดจาก 30 % ของ calories ที่ควรได้รับต่อวัน"),
        actions: [
          closeButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    if (check == 1) {
      AlertDialog alert = AlertDialog(
        title: Text("Carp"),
        content: Text("คิดจาก 40 % ของ calories ที่ควรได้รับต่อวัน"),
        actions: [
          closeButton,
        ],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    if (check == 2) {
      AlertDialog alert = AlertDialog(
        title: Text("Fat"),
        content: Text("คิดจาก 30 % ของ calories ที่ควรได้รับต่อวัน"),
        actions: [
          closeButton,
        ],
      );
      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }

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
          tdee2 = int.parse(tdee);
          final List num1 = [
            userDocument["BMR"].toString(),
            userDocument["TDEE"].toString(),
            userDocument["โปรตีน"].toString(),
            userDocument["คาร์โบไฮเดรท"].toString(),
            userDocument["ไขมัน"].toString(),
          ];
          num12 = num1;
          final List num2 = [
            userDocument["BMR"].toString(),
            userDocument["TDEEคำนวณ"].toString(),
            userDocument["โปรตีนคำนวณ"].toString(),
            userDocument["คาร์โบไฮเดรทคำนวณ"].toString(),
            userDocument["ไขมันคำนวณ"].toString(),
          ];
          choose(BuildContext context) {
            // set up the button
            if (check2 == 0) {
              Widget okbutton = TextButton(
                  child: Text("เลือก"),
                  onPressed: () async {
                    setState(() {
                      for (int i = 0; i < num1.length; i++) {
                        FirebaseFirestore.instance
                            .collection("user2")
                            .doc(this.email)
                            .update({
                          "BMR": num1[0],
                          "TDEE": num1[1],
                          "โปรตีน": num1[2],
                          "คาร์โบไฮเดรท": num1[3],
                          "ไขมัน": num1[4]
                        });
                      }
                    });
                  });
              Widget cancelbutton = TextButton(
                  child: Text("ยกเลิก"),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                  });
              // set up the AlertDialog

              AlertDialog alert = AlertDialog(
                content: Text("เลือกแบบเริ่มต้นใช่หรือไม่"),
                actions: [okbutton, cancelbutton],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
            if (check2 == 1) {
              Widget okbutton = TextButton(
                  child: Text("เลือก"),
                  onPressed: () async {
                    setState(() {
                      for (int i = 0; i < num2.length; i++) {
                        FirebaseFirestore.instance
                            .collection("user2")
                            .doc(this.email)
                            .update({
                          "BMR": num2[0],
                          "TDEE": num2[1],
                          "โปรตีน": num2[2],
                          "คาร์โบไฮเดรท": num2[3],
                          "ไขมัน": num2[4]
                        });
                      }
                    });
                  });
              Widget cancelbutton = TextButton(
                  child: Text("ยกเลิก"),
                  onPressed: () async {
                    Navigator.of(context, rootNavigator: true).pop();
                  });
              // set up the AlertDialog

              AlertDialog alert = AlertDialog(
                content: Text("เลือกแบบกำหนดเองใช่หรือไม่"),
                actions: [okbutton, cancelbutton],
              );
              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          }

          return MaterialApp(
              home: DefaultTabController(
            length: 2,
            child: Scaffold(
                body: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    backgroundColor: blue2,
                    bottom: TabBar(
                      tabs: [
                        Tab(
                            child: Text("แนะนำ",
                                style: GoogleFonts.mitr(fontSize: 20))),
                        Tab(
                            child: Text("ขั้นสูง",
                                style: GoogleFonts.mitr(fontSize: 20))),
                      ],
                    ),
                    title:
                        Text("สรุปผล", style: GoogleFonts.mitr(fontSize: 30)),
                  ),
                ];
              },
              body: TabBarView(children: [
                ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: itemnum,
                  // ignore: missing_return
                  itemBuilder: (BuildContext context, int index) {
                    final testt = sum[index];
                    final testnum = num1[index];
                    return Column(children: [
                      Container(
                        height: 130,
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Container(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text(
                                          testt,
                                          style: GoogleFonts.k2d(
                                              fontSize: 32,
                                              color: index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      if (index > 1)
                                        IconButton(
                                            iconSize: 40,
                                            onPressed: () {
                                              if (index == 2) {
                                                check = 0;
                                                alert(context);
                                              } else if (index == 3) {
                                                check = 1;
                                                alert(context);
                                              } else if (index == 4) {
                                                check = 2;
                                                alert(context);
                                              }
                                            },
                                            icon: Icon(Icons.info_outline)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          testnum,
                                          style: GoogleFonts.k2d(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 32,
                                              color: index % 2 == 0
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      if (index <= 1)
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            "kcal",
                                            style: GoogleFonts.k2d(
                                                fontSize: 30,
                                                color: index % 2 == 0
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                      if (index >= 2)
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            "gram",
                                            style: GoogleFonts.k2d(
                                                fontSize: 32,
                                                color: index % 2 == 0
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            color: index % 2 == 0 ? orange1 : orange2,
                            alignment: Alignment.center,
                            height: 140.0,
                          ),
                        ),
                      ),
                      if (index == 4)
                        ElevatedButton(
                          onPressed: () {
                            FirebaseFirestore.instance
                                .collection("user2")
                                .doc(this.email)
                                .set({});
                            setState(() {
                              check2 = 0;
                              choose(context);
                            });
                          },
                          child: Text(
                            "เสร็จสิ้น",
                            style: GoogleFonts.mitr(
                                fontSize: 20,
                                textStyle: TextStyle(color: Colors.white)),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: blue2,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        )
                    ]);
                  },
                ),
                ListView.builder(
                  padding: EdgeInsets.only(top: 10),
                  itemCount: 5,
                  // ignore: missing_return
                  itemBuilder: (BuildContext context, int index) {
                    final testt = sum[index];
                    final testnum = num2[index];
                    return Column(
                      children: [
                        Container(
                          height: 130,
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Container(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 15),
                                          child: Text(
                                            testt,
                                            style: GoogleFonts.k2d(
                                                fontSize: 32,
                                                color: index % 2 == 0
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                        ),
                                        if (index > 1)
                                          IconButton(
                                              iconSize: 40,
                                              onPressed: () {
                                                if (index == 2) {
                                                  check = 0;
                                                  alert(context);
                                                } else if (index == 3) {
                                                  check = 1;
                                                  alert(context);
                                                } else if (index == 4) {
                                                  check = 2;
                                                  alert(context);
                                                }
                                              },
                                              icon: Icon(Icons.info_outline)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Text(
                                            testnum,
                                            style: GoogleFonts.k2d(
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 32,
                                                color: index % 2 == 0
                                                    ? Colors.black
                                                    : Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        if (index <= 1)
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              "kcal",
                                              style: GoogleFonts.k2d(
                                                  fontSize: 32,
                                                  color: index % 2 == 0
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                        if (index >= 2)
                                          Container(
                                            margin: EdgeInsets.only(bottom: 20),
                                            child: Text(
                                              "gram",
                                              style: GoogleFonts.k2d(
                                                  fontSize: 32,
                                                  color: index % 2 == 0
                                                      ? Colors.black
                                                      : Colors.white),
                                            ),
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              color: index % 2 == 0 ? orange2 : orange1,
                              alignment: Alignment.center,
                              height: 140.0,
                            ),
                          ),
                        ),
                        if (index == 4)
                          ElevatedButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("user2")
                                  .doc(this.email)
                                  .set({});
                              setState(() {
                                check2 = 1;
                                choose(context);
                              });
                            },
                            child: Text(
                              "เสร็จสิ้น",
                              style: GoogleFonts.mitr(
                                  fontSize: 20,
                                  textStyle: TextStyle(color: Colors.white)),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: blue2,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          )
                      ],
                    );
                  },
                ),
              ]),
            )),
          ));
        });
  }
}
