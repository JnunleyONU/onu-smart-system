import 'package:flutter/material.dart';
import 'package:onu_smart/widgets/default_banner.dart';

class PrinterHome extends StatelessWidget{
  const PrinterHome ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultbanner(context, "Smart Printing"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(
              onPressed: () {
                //Start print function code
              },
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.orange, // Set the font color to black
            ),
              child: const Text('Start Print'),
            ),
            ElevatedButton(
              onPressed: () {
                //Stop print function code
              },
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.orange, // Set the font color to black
            ),
              child: const Text('Stop Print'),
            ),
            ElevatedButton(
              onPressed: () {
                //Stop print function code
              },
              style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.orange, // Set the font color to black
            ),
              child: const Text('Monitor'),
            ),
          ],
        ),
      ),
    );
  }
}