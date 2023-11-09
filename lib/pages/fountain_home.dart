import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class FountainHome extends StatelessWidget {
  const FountainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMART System Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ElevatedButton(
              onPressed: () {
                makePink('pink');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              padding: EdgeInsets.all(16), // Set 16 pixels of padding on all sides
              onPrimary: Colors.black, // Set the font color to black
            ),
              child: const Text('Pink'),
            ),
            ElevatedButton(
              onPressed: () {
                makeNormal('Normal');
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              padding: EdgeInsets.all(16), // Set 16 pixels of padding on all sides
              onPrimary: Colors.black, // Set the font color to black
            ),
              child: const Text('normal'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<http.Response> makePink(String title) {
  return http.get(
    Uri.parse('http://jlk-statue.ad.onu.edu/pink'),
  );
}

Future<http.Response> makeNormal(String title) {
  return http.get(
    Uri.parse('http://jlk-statue.ad.onu.edu/normal'),
  );
}
