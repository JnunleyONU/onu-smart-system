import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'dart:convert';

var globalData;

class ReadExamples extends StatefulWidget {
  const ReadExamples({super.key});

  @override
  State<ReadExamples> createState() => _ReadExamplesState();
}

class _ReadExamplesState extends State<ReadExamples> {
  String _displayText = 'Results go here still';
  String testJSON = '';
  final jsonString =
      // '{"text": {"test2":null}, "value": 1, "status": false, "extra": null}';
      // '{"Sheet1": {"test": {"Major": "EE", "Name": "test"}, "super" : {"Major": "me", "Name": "super" }}}';
      '{Sheet1: {test: {Major: EE, Name: test}, super: {Major: me, Name: super}}}';
  final _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _database
        .child('1eBfu_F_M6x46hjeJrIZj84gxWmCOHjXrLA6r0Xl3Als')
        .onValue
        .listen((event) {
      final data = event.snapshot.value;
      setState(() {
        _displayText = "$data";
      });
    });
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
                // print(json.encode(_displayText));
                print("display text: " + _displayText);
                // print(testJSON);
                // var tagsJson = jsonDecode(_displayText)['Sheet1'];
                var tagsJson = jsonEncode(_displayText);

                print("encoded: " + tagsJson);

                tagsJson = jsonDecode(_displayText);
                print("Decoded: " + tagsJson);

                // List<String>? tags =
                //     tagsJson != null ? List.from(tagsJson) : null;
                // print(tags);
              },
              child: const Text("Read Data"))
        ]),
      )),
    );
  }
}

// class User {
//   String? name;
//   int? age;
// }

// class Tutorial {
//   String title;
//   String description;
//   User author;

//   Tutorial(this.title, this.description, this.author);

//   factory Tutorial.fromJson(dynamic json) {
//     return Tutorial(json['title'] as String, json['description'] as String, User.fromJson(json['author']));
//   }

//   @override
//   String toString() {
//     return '{ ${this.title}, ${this.description}, ${this.author} }';
//   }
// }

testFunc() {
  String arrayText = '{"tags": ["dart", "flutter", "json"]}';

  var tagsJson = jsonDecode(arrayText)['tags'];
  List<String>? tags = tagsJson != null ? List.from(tagsJson) : null;

  print(tags);
}
