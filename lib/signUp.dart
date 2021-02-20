
import 'package:flutter/material.dart';
import 'package:puviarasi_iot/bottomNavigation.dart';
import 'package:puviarasi_iot/signIn.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

String _selectedLocation;
  List<String> _locations = ['Male', 'Female', 'transgender'];
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
                    SizedBox(
                      height: 30,
                    ),
                    Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Name"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Email"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      width: MediaQuery.of(context).size.width/0.7,
                      child: DropdownButtonHideUnderline(

                        child: DropdownButton<String>(
                          isDense: true,

                          value: _selectedLocation,
                          hint: Text("Gender"),
                          onChanged: (String newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          items: _locations.map((String location) {
                            return new DropdownMenuItem<String>(
                              child: new Text(location),
                            );
                          }).toList()),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                        isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Password"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Department"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Age"
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(65, 10, 65, 10),
                        child: Text("Sign Up"),
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
                              child: Text("Sign up with Google"),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(new MaterialPageRoute(
                              builder: (context) => PuviarasiIOT()));
                        }
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Wrap(
                      spacing: 5,
                      children: [
                        Text("having Account, Click to",style: TextStyle(color: Colors.black),),
                        InkWell(
                          child: Text("Sign In",style: TextStyle(color: Colors.blue)),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInPage()));
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
