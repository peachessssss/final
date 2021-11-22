import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heal/meal2.dart';

class meal extends StatefulWidget {
  @override
  State<meal> createState() => _meal();
}

class _meal extends State<meal> {
  List menu;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("อาหาร")
            .where("ชื่อ")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text('รายการอาหาร',
                  style: GoogleFonts.mitr(color: Colors.black, fontSize: 24)),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MaterialCommunityIcons.check_circle_outline,
                    color: Colors.black,
                    size: 32,
                  ),
                )
              ],
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: ListView(
                    children: snapshot.data.docs.map((document) {
                      return new ListTile(
                        title: new Text(document['ชื่อ']),
                        onTap: () {
                          List menu = [
                            document["ชื่อ"].toString(),
                            document["โปรตีน"].toString(),
                            document["คาร์โบไฮเดรท"].toString(),
                            document["ไขมัน"].toString(),
                          ];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => meal2(),
                                  settings: RouteSettings(
                                      arguments: document['ชื่อ'])));
                          print(menu);
                        },
                      );
                    }).toList(),
                  )),
                ],
              ),
            ),
          );
        });
  }
}
