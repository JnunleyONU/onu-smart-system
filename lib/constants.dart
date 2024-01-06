import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const onuOrange = Color.fromARGB(255, 252, 104, 6);
const String excelRoot = '/1eBfu_F_M6x46hjeJrIZj84gxWmCOHjXrLA6r0Xl3Als';
String? userName = '';
var allFacultyMembers = {
  "Ahmed Ammars": "ECCS",
  "Ahmed Oun": "ECCS",
  "Ajmal Khan": "ECCS",
  "Enass Hriba": "ECCS",
  "Farha Jahan": "ECCS",
  "Firas Hassan": "ECCS",
  "Heath LeBlanc": "ECCS",
  "Ian Kropp": "ECCS",
  "John Estell": "ECCS",
  "Khalid Al-Olimat": "ECCS",
  "Nancy Stuart": "ECCS",
  "Stephany Coffman-Wolph": "ECCS",
  "Bryan Boulanger": "Civil",
  "Jill Dotson": "Civil",
  "Todd France": "Civil",
  "David Johnstone": "Civil",
  "Lauren Logan": "Civil",
  "Ramin Rabiee": "Civil",
  "Seyed Mohmmad Seyed Ardakani": "Civil",
  "Bob Ward": "Civil",
  "Fan Ye": "Civil",
  "Xiangya Cheng": "Mechanical",
  "Abby Clark": "Mechanical",
  "Louis DiBerardino": "Mechanical",
  "Larry Funke": "Mechanical",
  "Josh Gargac": "Mechanical",
  "Blake Hylton": "Mechanical",
  "Jed Marquart": "Mechanical",
  "David Mikesell": "Mechanical",
  "David Sawyers": "Mechanical",
  "Lisa Shadle": "Mechanical",
  "Hui Shen": "Mechanical",
  "Scott Cottle": "ENGR",
  "Lori Goldsmith": "Civil",
  "Jodi Kennedy": "Civil",
  "Laurie Laird": "Civil",
  "Jeff Martz": "Civil",
  "Tricia Profit": "Civil",
  "Chris Winters": "Civil",
  "J.D. Yoder": "Civil",
  "Tom Zechman": "Civil",
};

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
