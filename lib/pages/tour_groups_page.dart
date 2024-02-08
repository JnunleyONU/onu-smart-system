import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_guide.dart';
import 'package:onu_smart/sorting_algorithm.dart';

class TourGroupsPage extends StatefulWidget {
  const TourGroupsPage({super.key});

  @override
  State<TourGroupsPage> createState() => TourGroupsPageState();
}

class TourGroupsPageState extends State<TourGroupsPage> {
  Future<void> createStudentsFromFirebase() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$incomingStudentExcelRoot/Students");

    final DataSnapshot snapShot = await ref.get();
    Map<String, dynamic>? rawData = jsonDecode(jsonEncode(snapShot.value));
    createStudents(rawData);
  }

  Future<void> createTourGuidesFromFirebase() async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("$tourGuideExcelRoot/Polar Preview");

    final DataSnapshot snapShot = await ref.get();
    Map<String, dynamic>? rawData = jsonDecode(jsonEncode(snapShot.value));
    createTourGuides(rawData);
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
              Text(listTheStudents(computerEngineeringStudents) +
                  listTheStudents(computerEngineeringTourGuides)),

              const Text(
                  textAlign: TextAlign.right, "Mechanical Engineering: "),
              Text(listTheStudents(mechanicalStudents) +
                  listTheStudents(mechanicalTourGuides)),

              const Text(textAlign: TextAlign.right, "Civil Engineering: "),
              Text(listTheStudents(civilStudents) +
                  listTheStudents(civilTourGuides)),

              const Text(
                  textAlign: TextAlign.right, "Electrical Engineering: "),
              Text(listTheStudents(electricalStudents) +
                  listTheStudents(electricalTourGuides)),

              const Text(textAlign: TextAlign.right, "Computer Science: "),
              Text(listTheStudents(computerScienceStudents) +
                  listTheStudents(computerScienceTourGuides)),

              const Text(textAlign: TextAlign.right, "UNSURE: "),
              Text(listTheStudents(unsortedStudents) +
                  listTheStudents(unsortedTourGuides)),

              ElevatedButton(
                child:
                    const Text("Create Student Objects and dispaly by Major"),
                onPressed: () {
                  createStudentsFromFirebase();
                  createTourGuidesFromFirebase();
                },
              ),
              ElevatedButton(
                child: const Text("Sort Students"),
                onPressed: () {
                  sortStudentsByMajor(masterStudentObjectList);
                  sortTourGuideByMajor(masterTourGuideObjectList);
                  setState(() {
                    //You can also make changes to your state here.
                  });
                },
              ),
              ElevatedButton(
                child: const Text("SORT"),
                onPressed: () {
                  sortingAlgorithm();
                  setState(() {
                    //You can also make changes to your state here.
                  });
                },
              ),
            ],
          ),
        ));
  }

  /// Creates string list of students from dynaminc list
  /// For some reason list.toString prints and instance of object rather than each index as a string
  String listTheStudents(List listOfStudentsByMajor) {
    List names = [];
    for (var element in listOfStudentsByMajor) {
      names.add(element.name);
    }
    return names.toString();
  }
}
