import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SliderCard extends StatefulWidget {
  final String titleGet;
  final Map<dynamic, dynamic> valueGet;
  SliderCard({this.titleGet, this.valueGet});
  @override
  _SliderCardState createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  double spaceingArea = 20;
  double fontSizein = 20;
  var svgImages = {
    "Temperature": "images/temp.svg",
    "Humidity": "images/humidity.svg",
    "SP02": "images/o2.svg",
    "BPM": "images/bpm.svg"
  };
  var iconColor = {
    "Temperature": false,
    "Humidity": true,
    "SP02": false,
    "BPM": false
  };
  // ignore: missing_return
  Widget makingData() {
    var valuegetter = widget.valueGet[widget.titleGet];
    switch (widget.titleGet) {
      case "Temperature":
        var temp;
        if (valuegetter >= 35 && valuegetter <= 39) {
          temp = "Positive";
        } else {
          temp = "Negative";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Range (35 - 39 \u2103)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSizein),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spaceingArea,
            ),
            Row(
              children: [
                Text(
                  "$temp",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSizein),
                ),
              ],
            ),
          ],
        );
        break;
      case "Humidity":
        var humi;
        if (valuegetter >= 40 && valuegetter <= 60) {
          humi = "Positive";
        } else {
          humi = "Negative";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Range (40 - 60 %)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSizein),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spaceingArea,
            ),
            Row(
              children: [
                Text(
                  "$humi",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSizein),
                ),
              ],
            )
          ],
        );
        break;
      case "SP02":
        var spo;
        if (valuegetter >= 95 && valuegetter <= 100) {
          spo = "Positive";
        } else {
          spo = "Negative";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Range (95 - 100 %)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSizein),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spaceingArea,
            ),
            Row(
              children: [
                Text(
                  "$spo",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSizein),
                ),
              ],
            )
          ],
        );
        break;
      case "BPM":
        var bpm;
        if (valuegetter >= 40 && valuegetter <= 185) {
          bpm = "Positive";
        } else {
          bpm = "Negative";
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    "Range (40 - 185 bpm)",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: fontSizein),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: spaceingArea,
            ),
            Row(
              children: [
                Text(
                  "$bpm",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: fontSizein),
                ),
              ],
            )
          ],
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _volumeValue = widget.valueGet['${widget.titleGet}'] + 0.0;
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
      child: Card(
        margin: EdgeInsets.only(top: 0),
        color: Color.fromRGBO(47, 47, 47, 1),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              elevation: 5,
              color: Color.fromRGBO(68, 68, 68, 1),
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 20,
                      children: [
                        iconColor[widget.titleGet]
                            ? SvgPicture.asset(
                                svgImages[widget.titleGet],
                                width: 30,
                              )
                            : SvgPicture.asset(
                                svgImages[widget.titleGet],
                                color: Colors.white,
                                width: 30,
                              ),
                        Text("${widget.titleGet}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSizein))
                      ],
                    ),
                    Icon(
                      Icons.insert_chart,
                      color: Colors.white54,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      width: 200,
                      height: 100,
                      child: SfRadialGauge(axes: <RadialAxis>[
                        RadialAxis(
                            minimum: 0,
                            maximum: 100,
                            showLabels: false,
                            showTicks: false,
                            axisLineStyle: AxisLineStyle(
                                cornerStyle: CornerStyle.bothCurve,
                                color: Colors.white54,
                                thickness: 15),
                            pointers: <GaugePointer>[
                              RangePointer(
                                  value: _volumeValue,
                                  cornerStyle: CornerStyle.bothCurve,
                                  width: 15,
                                  sizeUnit: GaugeSizeUnit.logicalPixel,
                                  gradient: const SweepGradient(colors: <Color>[
                                    // Color(0xFFCC2B5E),
                                    // Color(0xFF753A88),
                                    Color(0xFFCC2B5E),
                                    Color(0xFF747100),
                                    Color(0xFF00857E),
                                    Color(0xFF006EDA)
                                  ], stops: <double>[
                                    0.25,
                                    0.50,
                                    0.75,
                                    0.100
                                  ])),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                  angle: 90,
                                  axisValue: 5,
                                  positionFactor: 0.2,
                                  widget: Text(
                                      _volumeValue.ceil().toString() +
                                          (widget.titleGet == "Temperature"
                                              ? "\u2103"
                                              : ' %'),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)))
                            ])
                      ]),
                    ),
                  ),
                  Flexible(
                    child: makingData(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
