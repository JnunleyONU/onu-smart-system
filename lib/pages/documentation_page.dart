import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
/*

import 'package:onu_smart/pages/fountain_documentation.dart';
import '';
*/

class DocumentationPage extends StatefulWidget {
  const DocumentationPage({super.key});

  @override
  State<DocumentationPage> createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("App Documentation"),
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


                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Fountain Control Documentation'),
              ),
              ElevatedButton(
                onPressed: () {

  

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Smart Printing Documentation'),
              ),
              ElevatedButton(
                onPressed: () {


                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Tour Automation Documentation'),
              ),
              ElevatedButton(
                onPressed: () {


                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Placeholder for Anything else'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
class HomePageButtonWidget extends StatefulWidget {
  const HomePageButtonWidget({
    super.key,
    required this.context,
    this.fountainDoc,
    this.printerDoc,
    this.tourDoc,
    this.documentationPage,
    //required this.homeIcon,
  });

  final BuildContext context;
  final FountainDoc? fountainDoc;
  final TourDoc? tourDoc;
  final PrinterDoc? printerDoc;
  final DocumentationPage? documentationPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 15, bottom: 0),
      margin: const EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (fountainDoc != null) {
                  return const FountainHome();
                } else if (tourDoc != null) {
                  return const TourHome();
                } else if (printerDoc != null) {
                  return const PrinterHome();
                } else if (documentationPage != null) {
                  return const DocumentationPage();
                } else {
                  return const Icon(Icons.abc);
                }
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 125),
            textStyle: const TextStyle(fontSize: 50),
            side: const BorderSide(color: onuOrange),
            // elevation: 1.0,
            padding: const EdgeInsets.all(2.0),
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        child: Icon(
          homeIcon,
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }
}
*/

