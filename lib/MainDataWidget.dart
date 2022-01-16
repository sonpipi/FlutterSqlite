import 'package:flutter/material.dart';
import 'SqliteServiceAPI.dart';

class MainDataWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MainDataWidget> {
  @override
  Widget build(BuildContext context) {
    SqliteServiceAPI.db.getItemAlls();
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter, // Center of Top
      children: <Widget>[
        Positioned(
            top: 20,
            left: 10,
            child: SizedBox.fromSize(
              size: Size(94, 98), // button width and height
              child: InkWell(
                onTap: () {
                  print('sonrpo');
                }, // button pressed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/navi.png"), // icon
                  ],
                ),
              ),
            )),
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
      ],
    ));
  }
}
