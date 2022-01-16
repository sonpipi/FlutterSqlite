import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'MainDataWidget.dart';
import 'model/items_info_Model.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
    home: HomePro()));

class HomePro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int pro = 0;
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (pro == 0) {
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainDataWidget()),
            );
      }
      pro = pro + 1;
    });

    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter, // Center of Top
      children: <Widget>[
        Positioned(
          top: 0,
          right: 0,
          child: Container(
              height: 302,
              width: 209,
              child: Image.asset('assets/trencung_1.png')),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
              height: 285,
              width: 375,
              child: Image.asset('assets/trencung_2.png')),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
              height: 559,
              width: 288,
              child: Image.asset('assets/duoicung_1.png')),
        ),
        Positioned(
          bottom: 100,
          left: 0,
          child: Container(
              height: MediaQuery.of(context).size.width * 1,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/oto_pro.png', fit: BoxFit.cover)),
        ),
        Positioned(
            top: 50,
            left: 30,
            child: Container(
              height: MediaQuery.of(context).size.width * 1,
              width: MediaQuery.of(context).size.width,
              child: Text("English Dictionary",
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
            )),
        Positioned(
            top: 90,
            left: 30,
            child: Container(
              height: MediaQuery.of(context).size.width * 1.3,
              width: MediaQuery.of(context).size.width,
              child: Text(
                  "A free offline dictionary (vocabulary) with easy and functional user interface, covers over 180.000 words.",
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
            )),
      ],
    ));
  }
}
