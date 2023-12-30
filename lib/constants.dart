import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onu_smart/pages/fountain_home.dart';
import 'package:onu_smart/pages/options.dart';
import 'package:onu_smart/pages/printer_home.dart';
import 'package:onu_smart/pages/tour_home.dart';

const onuOrange = Color.fromARGB(255, 252, 104, 6);

BottomNavigationBar bottomNavigation() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.phone,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.mail,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: Colors.black,
        ),
        label: "",
      ),
    ],
  );
}

class HomePageButtonWidget extends StatelessWidget {
  const HomePageButtonWidget({
    super.key,
    required this.context,
    this.fountainHome,
    this.tourHome,
    this.printerHome,
    this.optionsHome,
    required this.homeIcon,
  });

  final BuildContext context;
  final FountainHome? fountainHome;
  final TourHome? tourHome;
  final PrinterHome? printerHome;
  final OptionsHome? optionsHome;
  final IconData homeIcon;

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
                if (fountainHome != null) {
                  return const FountainHome();
                } else if (tourHome != null) {
                  return const TourHome();
                } else if (printerHome != null) {
                  return const PrinterHome();
                } else if (optionsHome != null) {
                  return const OptionsHome();
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

AppBar generalAppBar(String headerText, [double? fontSize]) {
  return AppBar(
    toolbarHeight: 80,
    elevation: 0.0,
    backgroundColor: onuOrange,
    title: Column(
      children: [
        Text(
          headerText, // Insert Username
          style: GoogleFonts.amiriQuran(
            fontSize: fontSize ?? 60,
          ),
        ),
        const Padding(padding: EdgeInsets.all(10))
      ],
    ),
    // centerTitle: true,
  );
}
