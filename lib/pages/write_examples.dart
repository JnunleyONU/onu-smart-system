import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({super.key});

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    // final dailySpecialRef = database.child
    final namesRef = database.child('names');

    return Scaffold(
      appBar: generalAppBar("Write page test"),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(children: [
          ElevatedButton(
              onPressed: () async {
                try {
                  // Creating new chiled
                  // await namesRef.set({
                  //   'name': 'Jared Flutter',
                  //   'Country': 'APP',
                  //   'age': '12',
                  // }).then((value) => print("names have been written"));

                  // Setting specificied child
                  // await namesRef.child('this').set('test');
                  await namesRef.set({allFacultyMembers});
                } catch (e) {
                  print("ERROR on write");
                }
              },
              child: const Text('simple set'))
        ]),
      )),
    );
  }
}
