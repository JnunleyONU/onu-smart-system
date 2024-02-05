import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onu_smart/constants.dart';

class OptionsHome extends StatelessWidget {
  const OptionsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Options"),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
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
            onPressed: () async {
              await GoogleSignIn().signOut();
              FirebaseAuth.instance.signOut();
            },
            child: const Text("Logout", style: TextStyle(color: Colors.black),),
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
