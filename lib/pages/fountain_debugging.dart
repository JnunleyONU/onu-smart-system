import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:onu_smart/constants.dart';

class FountainDebugging extends StatefulWidget {
  const FountainDebugging({super.key});

  @override
  State<FountainDebugging> createState() => _FountainDebuggingState();
}

class _FountainDebuggingState extends State<FountainDebugging> {
  int row = -1;
  int column = 0;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

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
              Text("Row: $row  Column: $column"),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    row = -1;
                    column = 0;
                  });

                  changemode('off');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Start: Reset'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    row += 1;
                  });
                  changemode('pink');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: onuOrange,
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Start: Increase Row'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    column += 1;
                  });
                  changemode('christmas');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Increase column'),
              ),

              // ElevatedButton(
              //   onPressed: () {
              //     changemode('bluering');
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor:
              //         onuOrange, // Set the background color to orange
              //     foregroundColor: Colors.black, // Set the font color to black
              //   ),
              //   child: const Text('Blue'),
              // ),
              ElevatedButton(
                onPressed: () {
                  changemode('normal');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Normal'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('rainbow');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('MuxA'),
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
                child: const Text('MuxB'),
              ),
              ElevatedButton(
                onPressed: () {
                  changemode('test');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      onuOrange, // Set the background color to orange
                  foregroundColor: Colors.black, // Set the font color to black
                ),
                child: const Text('Turn ON Ring'),
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
