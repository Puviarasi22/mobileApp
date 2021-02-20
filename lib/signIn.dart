import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:puviarasi_iot/signUp.dart';

import 'bottomNavigation.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
      // child: MyApp(),
      child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign IN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                SizedBox(
                  height: 30,
                ),
                TextFormField(

                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10)
                    ),
                    labelText: "Email"
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      labelText: "Password",

                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                    child: Text("Sign In"),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          builder: (context) => PuviarasiIOT()));
                    }
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Or",style: TextStyle(color: Colors.black),),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 20,
                        child: Image.asset(
                          "images/G.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text("Sign in with Google"),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (context) => new PuviarasiIOT()));
                  }
                ),
                SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Text("Not having Account, Click to",style: TextStyle(color: Colors.black),),
                    InkWell(
                      child: Text("Sign Up",style: TextStyle(color: Colors.blue)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    ),
        ));
  }
}
