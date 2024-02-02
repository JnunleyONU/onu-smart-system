import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/student.dart';

class TourGroupsPage extends StatefulWidget {
  const TourGroupsPage({super.key});

  @override
  State<TourGroupsPage> createState() => TourGroupsPageState();
}

class TourGroupsPageState extends State<TourGroupsPage> {
  Future<void> createStudentsFromFirebase() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("$excelRoot/Sheet1");

    final DataSnapshot snapShot = await ref.get();
    Map<String, dynamic>? rawData = jsonDecode(jsonEncode(snapShot.value));
    createStudents(rawData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onuOrange,
        appBar: generalAppBar("Tour Groupings"),
        body: Container(
          height: 800,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              // createTexttextfields(5),
              const Text(textAlign: TextAlign.right, "Computer Engineering: "),
              Text(listTheStudents(computerEngineeringStudents)),

              const Text(
                  textAlign: TextAlign.right, "Mechanical Engineering: "),
              Text(listTheStudents(mechanicalStudents)),

              const Text(textAlign: TextAlign.right, "Civil Engineering: "),
              Text(listTheStudents(civilStudents)),

              const Text(
                  textAlign: TextAlign.right, "Electrical Engineering: "),
              Text(listTheStudents(electricalStudents)),

              const Text(textAlign: TextAlign.right, "Computer Science: "),
              Text(listTheStudents(computerScienceStudents)),

              const Text(textAlign: TextAlign.right, "UNSURE: "),
              Text(listTheStudents(unsortedStudents)),

              ElevatedButton(
                child:
                    const Text("Create Student Objects and dispaly by Major"),
                onPressed: () {
                  createStudentsFromFirebase();
                },
              ),
              ElevatedButton(
                child: const Text("Sort Students"),
                onPressed: () {
                  sortStudentsByMajor(masterStudentObjectList);
                  setState(() {
                    //You can also make changes to your state here.
                  });
                },
              ),
            ],
          ),
        ));
  }

  // createSortedStudentDisplay(int d) {
  //   var textEditingControllers = <TextEditingController>[];

  //   var textFields = <TextField>[];
  //   var list = new List<int>.generate(d, (i) => i + 1);
  //   print(list);

  //   list.forEach((i) {
  //     var textEditingController = new TextEditingController(text: "test $i");
  //     textEditingControllers.add(textEditingController);
  //     return textFields.add(new TextField(controller: textEditingController));
  //   });
  //   return Column(children: textFields);
  // }

  String listTheStudents(List listOfStudentsByMajor) {
    List names = [];
    for (var element in listOfStudentsByMajor) {
      names.add(element.name);
    }
    return names.toString();
  }
}
