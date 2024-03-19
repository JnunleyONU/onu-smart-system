// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/display_sort.dart';
import 'package:onu_smart/pages/read_examples.dart';
import 'package:onu_smart/pages/roadmap.dart';
import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_groups_page.dart';
import 'package:onu_smart/pages/tour_guide.dart';
import 'package:onu_smart/pages/write_examples.dart';
import 'package:onu_smart/sorting_algorithm.dart';

class TourHome extends StatelessWidget {
  const TourHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Smart Tour"),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await createStudentsFromFirebase();
                  await createTourGuidesFromFirebase();
                  sortStudentsByMajor(masterStudentObjectList);
                  sortTourGuideByMajor(masterTourGuideObjectList);
                  sortingAlgorithm();
                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DisplaySort(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('View Sorted Groups'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    print("Trying");
                    masterTourGuideObjectList[0].name;
                    print("tried");
                  } catch (e) {
                    print("catching");
                    await createStudentsFromFirebase();
                    await createTourGuidesFromFirebase();
                    sortStudentsByMajor(masterStudentObjectList);
                    sortTourGuideByMajor(masterTourGuideObjectList);
                    sortingAlgorithm();
                  }

                  Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoadMap(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('Road Map'),
              ),
              ElevatedButton(
                onPressed: () async {
                  try {
                    print("Trying");
                    masterTourGuideObjectList[0].name;
                    sendEmail();
                    print("tried");
                  } catch (e) {
                    print("catching");
                    await createStudentsFromFirebase();
                    await createTourGuidesFromFirebase();
                    sortStudentsByMajor(masterStudentObjectList);
                    sortTourGuideByMajor(masterTourGuideObjectList);
                    sortingAlgorithm();
                    sendEmail();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('Email Groups'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TourGroupsPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('Debug'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
