import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/css/color.dart';

class water extends StatefulWidget {
  @override
  _water createState() => _water();
}

class _water extends State<water> {
  Color coloricon = Colors.black;
  String hour;
  String minute;
  void check(String hour, String minute) {
    print("hour = $hour" + " " + "minute = $minute");
    if (hour != null && minute != null) {
      coloricon = Colors.blue;
    } else if (hour == null || minute == null) {
      coloricon = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    check(hour, minute);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('น้ำ',
              style: GoogleFonts.mitr(color: Colors.black, fontSize: 24)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                MaterialCommunityIcons.check_circle_outline,
                color: coloricon,
                size: 32,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/images/water100%.png", height: 200),
            ),
            SizedBox(height: 40),
            Container(
              alignment: Alignment.center,
              child: Text("ตั้งค่าเวลา",
                  style: GoogleFonts.mitr(color: Colors.black, fontSize: 24)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(left: 50),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() => hour = val);
                          if (hour.isEmpty) {
                            hour = null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "ชั่วโมง",
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
                ),
                Flexible(
                    child: Text(":",
                        style: GoogleFonts.mitr(
                            color: Colors.black, fontSize: 36))),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 50),
                    child: TextFormField(
                        onChanged: (val) {
                          setState(() => minute = val);
                          if (minute.isEmpty) {
                            minute = null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "นาที",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: blue4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(color: blue4),
                          ),
                        )),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Text("จำนวนที่ต้องการดื่ม",
                  style: GoogleFonts.mitr(color: Colors.black, fontSize: 24)),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(right: 40),
                      child: TextFormField(
                        onChanged: (val) {
                          setState(() => hour = val);
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
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
                ),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(right: 40),
                      child: Text("ml",
                          style: GoogleFonts.mitr(
                              color: Colors.black, fontSize: 36))),
                ),
              ],
            ),
          ],
        ));
  }
}
