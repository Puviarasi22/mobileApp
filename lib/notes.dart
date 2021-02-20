import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotesData extends StatefulWidget {
  final List getmainData;
  NotesData({this.getmainData});
  @override
  _NotesDataState createState() => _NotesDataState();
}

class _NotesDataState extends State<NotesData> {
  List dataSet = [];
  TextEditingController tempData = TextEditingController();
  TextEditingController humData = TextEditingController();
  TextEditingController spData = TextEditingController();
  TextEditingController bpmData = TextEditingController();
  TextEditingController cholData = TextEditingController();
  TextEditingController hRData = TextEditingController();
  TextEditingController gluData = TextEditingController();
  TextEditingController bmiData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    setState(() {
      dataSet = widget.getmainData;
    });
    print(dataSet);
    return Scaffold(
      appBar: AppBar(
        title: Text("User Notes"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var spaceingData = 20.0;
          return Dismissible(
            key: Key("${dataSet[index]['Temperature']}"),
            onDismissed: (darection) {
              dataSet.removeAt(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${DateFormat('dd-MM-yyyy').format(dataSet[index]["dataTime"])}",
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: spaceingData / 2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: spaceingData,
                                      children: [
                                        Text("Temperature",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text("${dataSet[index]["Temperature"]}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: spaceingData / 2,
                                    ),
                                    Wrap(
                                      spacing: spaceingData + 24,
                                      children: [
                                        Text("Humidity",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text("${dataSet[index]["Humidity"]}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Wrap(
                                      spacing: spaceingData,
                                      children: [
                                        Text("SP02",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text("${dataSet[index]["SP02"]}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                    SizedBox(
                                      height: spaceingData / 2,
                                    ),
                                    Wrap(
                                      spacing: spaceingData + 2,
                                      children: [
                                        Text("BPM",
                                            style:
                                                TextStyle(color: Colors.black)),
                                        Text("${dataSet[index]["BPM"]}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                              ])
                        ]),
                  )),
            ),
          );
        },
        itemCount: dataSet.length,
      ),
      floatingActionButton: RaisedButton(
          color: Colors.blue,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Prediction",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            tempData.clear();
            humData.clear();
            spData.clear();
            bpmData.clear();
            cholData.clear();
            hRData.clear();
            gluData.clear();
            bmiData.clear();
            showPop();
          }),
    );
  }

  showPop() {
    var spacedata = 15.0;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Manual Prediction"), CloseButton()],
            ),
            content: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: spacedata),
                TextFormField(
                  controller: tempData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Temperature",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: humData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Humidity",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: spData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "SP02",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: bpmData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "BPM",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: cholData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Cholesterol",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: hRData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "HeartRate",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: gluData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "Glucose",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata),
                TextFormField(
                  controller: bmiData,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: "BMI",
                      contentPadding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                ),
                SizedBox(height: spacedata + 10),
                RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      setState(() {
                        // Map<dynamic, dynamic> getDataof = {
                        //   "Temperature": tempData.text,
                        //   "Humidity": humData.text,
                        //   "SP02": spData.text,
                        //   "BPM": bpmData.text,
                        //   "dataTime": DateTime.now()
                        // };
                        // dataSet.add(getDataof);
                        if (int.parse(cholData.text) == 210 &&
                            int.parse(hRData.text) == 80 &&
                            int.parse(gluData.text) == 74 &&
                            int.parse(bmiData.text) == 21) {
                          valueDefined = "Normal";
                        } else if (int.parse(cholData.text) == 250 &&
                            int.parse(hRData.text) == 120 &&
                            int.parse(gluData.text) == 110 &&
                            int.parse(bmiData.text) == 30) {
                          valueDefined = "Heart Disease";
                        }
                        Navigator.pop(context);
                        resultPop();
                      });
                    })
              ]),
            ),
          );
        });
  }

  var valueDefined;
  resultPop() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            titlePadding: EdgeInsets.zero,
            title: Align(
                alignment: Alignment.centerRight,
                child: CloseButton(
                  color: Colors.white,
                )),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "The Persion is Diagnosed",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$valueDefined",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        });
  }
}
