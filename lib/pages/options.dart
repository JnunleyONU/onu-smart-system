import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

import 'package:onu_smart/widgets/default_banner.dart';

class OptionsHome extends StatelessWidget{
  const OptionsHome ({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultbanner(context, "Option Page"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                //Any options function
              },
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: onuOrange, // Set the background color to orange
              padding: const EdgeInsets.all(16), // Set the font color to black
            ),
              child: const Text('Language'),
            ),
          ],
        ),
      ),
    );
  }
}