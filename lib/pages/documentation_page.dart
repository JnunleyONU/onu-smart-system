import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

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
      appBar: generalAppBar("Documentation"),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: onuOrange,
                fixedSize: const Size(300, 75),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () async {},
            child: const Text("Documentation Will Be here"),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
