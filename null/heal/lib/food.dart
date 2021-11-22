import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/addfood.dart';
import 'package:heal/css/color.dart';
import 'package:heal/css/list.dart';
import 'package:heal/meal.dart';

// ignore: must_be_immutable
class food extends StatefulWidget {
  @override
  _food createState() => _food();
}

class _food extends State<food> {
  double level1 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: blue2,
          centerTitle: true,
          title: Text('อาหาร', style: GoogleFonts.mitr(fontSize: 24)),
          actions: [
            PopupMenuButton(
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                      PopupMenuItem(value: 0, child: Text("เพิ่มรายการอาหาร")),
                      PopupMenuItem(value: 1, child: Text("เพิ่มมื้ออาหาร"))
                    ])
          ],
        ),
        body: Container(
          child: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(50),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: 1.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.orange),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: 0.7,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          value: level1,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.purple),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (name[0] == 1)
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: Text("มื้อที่ 1 35%",
                            style: GoogleFonts.mitr(fontSize: 20)),
                      ),
                    if (name[1] == 1)
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text("มื้อที่ 2 15%",
                            style: GoogleFonts.mitr(fontSize: 20)),
                      ),
                    if (name[2] == 1)
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text("มื้อที่ 3 20%",
                            style: GoogleFonts.mitr(fontSize: 20)),
                      ),
                    if (name[3] == 1)
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text("มื้อที่ 4 30%",
                            style: GoogleFonts.mitr(fontSize: 20)),
                      ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: blue2, width: 3)),
              child: Column(
                children: [
                  Container(
                    child: Text("สารอาหารที่ได้รับจากอาหารทุกมื้อ",
                        style: GoogleFonts.mitr(fontSize: 20)),
                  ),
                  SizedBox(height: 10),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "โปรตีน",
                        style: GoogleFonts.mitr(fontSize: 20),
                      ),
                      Text("10 กรัม", style: GoogleFonts.mitr(fontSize: 20))
                    ],
                  )),
                  SizedBox(height: 10),
                  linear1,
                  SizedBox(height: 10),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("คาร์โบไฮเดรท",
                          style: GoogleFonts.mitr(fontSize: 20)),
                      Text("10 กรัม", style: GoogleFonts.mitr(fontSize: 20))
                    ],
                  )),
                  SizedBox(height: 10),
                  linear1,
                  SizedBox(height: 10),
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ไขมัน", style: GoogleFonts.mitr(fontSize: 20)),
                      Text("10 กรัม", style: GoogleFonts.mitr(fontSize: 20))
                    ],
                  )),
                  SizedBox(height: 10),
                  linear1
                ],
              ),
            ),
          ]),
        ));
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => addfood()));
      break;
    case 1:
      Navigator.push(context, MaterialPageRoute(builder: (context) => meal()));
  }
}
