import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const onuOrange = Color.fromARGB(255, 252, 104, 6);
const String excelRoot = '/1eBfu_F_M6x46hjeJrIZj84gxWmCOHjXrLA6r0Xl3Als';
String? userName = '';

BottomNavigationBar bottomNavigation() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.lightbulb_outline,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.print,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.emoji_people_rounded,
          color: Colors.black,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings_outlined,
          color: Colors.black,
        ),
        label: "",
      ),
    ],
  );
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
            fontSize: fontSize ?? 40,
          ),
        ),
        const Padding(padding: EdgeInsets.all(10))
      ],
    ),
    // centerTitle: true,
  );
}
