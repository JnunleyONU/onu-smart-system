import 'package:flutter/material.dart';

import 'package:onu_smart/widgets/default_banner.dart';

class TourHome extends StatelessWidget{
  const TourHome ({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultbanner(context, "Smart Tour"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //Any tour function
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              padding: EdgeInsets.all(16), // Set 16 pixels of padding on all sides
            ),
              child: const Text('Information'),
            ),
          ],
        ),
      ),
    );
  }
}