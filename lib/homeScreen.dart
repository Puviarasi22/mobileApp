import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:puviarasi_iot/notes.dart';

import 'widgets/common_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<dynamic, dynamic> fsListGet;

  List titleData = ["Temperature", "Humidity", "SP02", "BPM"];

  @override
  Widget build(BuildContext context) {
    Stream getData() async* {
      final firebaseuser = FirebaseDatabase().reference().child("data");

      var king = await firebaseuser.once();
      yield king;
    }

    List mainDataGet = [];
    return Scaffold(
      appBar: AppBar(title: Text("Puviarasi IOT"), actions: [
        IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
        IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              fsListGet["dataTime"] = DateTime.now();
              mainDataGet.add(fsListGet);
            }),
        IconButton(
            icon: Icon(Icons.note_add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotesData(
                            getmainData: mainDataGet,
                          )));
            })
      ]),
      body: Container(
        decoration: BoxDecoration(color: Colors.black
            // image: DecorationImage(
            //     image: AssetImage("images/wall2.jpg"), fit: BoxFit.cover)
            ),
        child: StreamBuilder(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              fsListGet = snapshot.data.value;
              return ListView.builder(
                itemCount: fsListGet.length,
                itemBuilder: (context, index) {
                  return SliderCard(
                    titleGet: titleData[index],
                    valueGet: fsListGet,
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
