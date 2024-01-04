import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onu_smart/constants.dart';

class FountainHome extends StatelessWidget {
  const FountainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Fountain Control", 40),
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
                  changemode('pink');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Pink'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('normal');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: onuOrange,
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('normal'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('christmas');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Christmas'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('bluering');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Blue'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('off');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Off'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}

Future<http.Response> changemode(String title) {
  return http.get(
    Uri.parse('http://jlk-statue.ad.onu.edu/$title'),
  );
}
