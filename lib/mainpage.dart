import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:testerx/sounds.dart';


class MyHomePage extends StatefulWidget {
  static const String Id = 'mainpage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String androidInfo_model = "";
  String androidInfo_brand;
  var deviceStr = "";
  void getSystemInfo() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    //print('Running on ${androidInfo.model}');  // e.g. "Moto G (4)"
    setState(() {
      androidInfo_model = androidInfo.model;
      androidInfo_brand = androidInfo.brand;
      //androidInfo_brand = androidInfo.device;
    });

    deviceStr = "";
    deviceStr += androidInfo.model + "\n";
    deviceStr += androidInfo.brand + "\n";
    deviceStr += androidInfo.device + "\n";
    deviceStr += androidInfo.display + "\n";
    deviceStr += androidInfo.fingerprint + "\n";
    deviceStr += androidInfo.id + "\n";
    deviceStr += androidInfo.hardware + "\n";
    deviceStr += androidInfo.version.baseOS + "\n";
    deviceStr += androidInfo.version.codename + "\n";
    deviceStr += androidInfo.version.incremental + "\n";
    deviceStr += androidInfo.version.release + "\n";
    deviceStr += androidInfo.version.sdkInt.toString() + "\n";



    print('Running on ${deviceStr}');



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFeeeeee),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 40,),
            Text(
              'Taxy Tester',style: TextStyle(fontSize: 30, color: Color(0xFFe91e63), fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15,),
            RaisedButton(
              onPressed: () async {
                getSystemInfo();
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFe91e63),
                      Color(0xFFec407a),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('System Information', style: TextStyle(fontSize: 20)),
              ),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 30, right: 20),
                child: Table(
                  border: TableBorder.all(color:Color(0xFFbdbdbd)),
                  columnWidths: {1 :FractionColumnWidth(.75) },
                  children:<TableRow> [
                    TableRow(
                      children: <Widget>[
                        Row(children:[
                          Icon(Icons.settings, size: 20,),
                          Text("Model", style: TextStyle(fontSize: 15,color: Color(0xFFe91e63), fontWeight: FontWeight.bold ),),
                        ]),
                        Row(children:[
                          Text(androidInfo_model!= null ?  androidInfo_model :"", style: TextStyle(fontSize: 15,),),
                        ])
                      ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Row(children:[
                            Icon(Icons.settings, size: 20,),
                            Text("Brand", style: TextStyle(fontSize: 15,color: Color(0xFFe91e63), fontWeight: FontWeight.bold ),),
                          ]),
                          Row(children:[
                            Text(androidInfo_brand != null ?androidInfo_brand :"", style: TextStyle(fontSize: 15,),),
                          ])
                        ]
                    ),
                    TableRow(
                        children: <Widget>[
                          Row(children:[
                            Icon(Icons.settings, size: 20,),
                            Text("Brand", style: TextStyle(fontSize: 15,color: Color(0xFFe91e63), fontWeight: FontWeight.bold ),),
                          ]),
                          Row(children:[
                            Text(androidInfo_brand != null ?androidInfo_brand :"", style: TextStyle(fontSize: 15,),),
                          ])
                        ]
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 30, right: 20),
              child: Text(deviceStr),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, SoundTester.Id, (route) => false);
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFe91e63),
                      Color(0xFFec407a),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child:
                const Text('Record Voice', style: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}