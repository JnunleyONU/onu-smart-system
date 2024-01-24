import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';


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
                  //Any tour function
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  padding: const EdgeInsets.all(
                      16), // Set 16 pixels of padding on all sides
                ),
                child: const Text('Information'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
