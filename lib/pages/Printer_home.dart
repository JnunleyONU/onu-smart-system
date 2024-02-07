// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

class PrinterHome extends StatelessWidget {
  const PrinterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Smart Printing"),
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
                  //Start print function code
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Start Print'),
              ),
              ElevatedButton(
                onPressed: () {
                  //Stop print function code
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Stop Print'),
              ),
              ElevatedButton(
                onPressed: () {
                  //Stop print function code
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Monitor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
