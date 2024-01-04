// ignore: file_names
import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/read_examples.dart';
import 'package:onu_smart/pages/tour_groups_page.dart';
import 'package:onu_smart/pages/write_examples.dart';

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
                child: const Text('Information'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WriteExamples(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('WRITE'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ReadExamples(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('Read'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
