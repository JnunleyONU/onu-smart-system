import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class fountainHome extends StatelessWidget {
  const fountainHome({super.key});

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
              child: const Text('pink'),
            ),
            ElevatedButton(
              onPressed: () {
                makeNormal('normal');
              },
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
