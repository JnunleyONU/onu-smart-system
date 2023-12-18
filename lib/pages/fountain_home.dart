import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onu_smart/widgets/default_banner.dart';


class FountainHome extends StatelessWidget {
  const FountainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultbanner(context, "Fountain Control"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () {
                changemode('pink');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange              
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('Pink'),
            ),
            ElevatedButton(
              onPressed: () {
                changemode('normal');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('normal'),
            ),
            ElevatedButton(
              onPressed: () {
                changemode('christmas');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('Christmas'),
            ),
            ElevatedButton(
              onPressed: () {
                changemode('bluering');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('Blue'),
            ),
              ElevatedButton(
              onPressed: () {
                changemode('off');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('Off'),
            ),            
          ],
        ),
      ),
    );
  }
}

Future<http.Response> changemode(String title) {
  return http.get(
    Uri.parse('http://jlk-statue.ad.onu.edu/$title'),
  );
}

