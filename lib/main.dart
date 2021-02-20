import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'signIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        primaryColor: Colors.black,
        // primarySwatch: Colors.purple[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
