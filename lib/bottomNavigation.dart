import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

import 'chat.dart';
import 'homeScreen.dart';

class PuviarasiIOT extends StatefulWidget {
  @override
  _PuviarasiIOTState createState() => _PuviarasiIOTState();
}

class _PuviarasiIOTState extends State<PuviarasiIOT> {
  Future getData() async {
    final firebaseuser = FirebaseDatabase().reference().child("data");

    return firebaseuser.once();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  var bottomNavIndex = 0;
  Widget home = HomeScreen();

  changeindex(val) {
    switch (val) {
      case 0:
        setState(() {
          home = HomeScreen();
        });
        return home;
        break;
      case 1:
        setState(() {
          home = HomePageDialogflow();
        });
        return home;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: home,
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        child: RollingNavBar.iconData(
          onTap: (val) {
            changeindex(val);
          },
          activeIndex: bottomNavIndex,
          iconColors: [Colors.white],
          activeIconColors: [Colors.white],
          indicatorColors: [Colors.black],
          animationCurve:
              Curves.easeOut, // `easeOut` (the default) is recommended here
          animationType: AnimationType.roll,
          baseAnimationSpeed: 200, // milliseconds
          iconData: <IconData>[Icons.home, Icons.chat],
        ),
      ),
    );
  }
}
