import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class meal2 extends StatefulWidget {
  @override
  State<meal2> createState() => _meal2();
}

class _meal2 extends State<meal2> {
  @override
  Widget build(BuildContext context) {
    final String todo = ModalRoute.of(context).settings.arguments;
    return new StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('อาหาร')
            .doc(todo)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          }
          var userDocument = snapshot.data;
          final List all = [
            userDocument["แคลอรี่"].toString(),
            userDocument["โปรตีน"].toString(),
            userDocument["คาร์โบไฮเดรท"].toString(),
            userDocument["ไขมัน"].toString(),
          ];
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(todo,
                  style: GoogleFonts.mitr(color: Colors.black, fontSize: 24)),
            ),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        /*1*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /*2*/
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Text(
                                all[0],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'calories',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      /*3*/
                      Icon(
                        Icons.circle,
                        color: Colors.blue[500],
                        size: 150,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          // Icon(Icons.kitchen, color: Colors.green[500]),
                          const Text(
                            'โปรตีน',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(all[1]),
                        ],
                      ),
                      Column(
                        children: [
                          // Icon(Icons.timer, color: Colors.green[500]),
                          const Text(
                            'คาร์โบไฮเดรต',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(all[2]),
                        ],
                      ),
                      Column(
                        children: [
                          // Icon(Icons.restaurant, color: Colors.green[500]),
                          const Text(
                            'ไขมัน',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(all[3]),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('ขนาดที่รับประทาน'),
                      const Text('1 จาน'),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 1.0,
                      width: 130.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
