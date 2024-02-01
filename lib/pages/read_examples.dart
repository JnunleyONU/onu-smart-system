import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

class ReadExamples extends StatefulWidget {
  const ReadExamples({super.key});

  @override
  State<ReadExamples> createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
  String _displayText = 'Results go here still';
  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _database
        .child('1eBfu_F_M6x46hjeJrIZj84gxWmCOHjXrLA6r0Xl3Als/Sheet1')
        .onValue
        .listen((event) {
      final data = event.snapshot.value;
      setState(() {
        _displayText = "Sheet1: $data";
        print("test" + _displayText);
      });
    });
  }

  Future<void> readProfileData() async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("1eBfu_F_M6x46hjeJrIZj84gxWmCOHjXrLA6r0Xl3Als/Sheet1");

    final DataSnapshot? snapShot = await ref.get();

    Map<String, dynamic> data = jsonDecode(jsonEncode(snapShot?.value));
    List testList = [];

    final keys = data.keys;
    keys.forEach((element) {
      testList.add(element);
    });

    for (var i = 0; i < 3; i++) {
      print(testList[i].toString());
    }
    // final jsonString = JSON.stri;
    // print(data);
    // final jsonFull = jsonDecode(jsonString);
    // var value = data.values;

    // value.forEach(print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: generalAppBar("Read page test"),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          Text(
            _displayText,
          ),
          ElevatedButton(
              onPressed: () {
                // print(_displayText
                readProfileData();
              },
              child: const Text("Read Data"))
        ]),
      )),
    );
  }
}
