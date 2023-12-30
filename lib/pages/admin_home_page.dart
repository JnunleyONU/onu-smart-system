import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/printer_home.dart';
import 'package:onu_smart/pages/tour_home.dart';
import 'package:onu_smart/pages/fountain_home.dart';
import 'package:onu_smart/pages/options.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Hello $userName"),
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
          child: Column(
            children: [
              Row(
                children: [
                  HomePageButtonWidget(
                      context: context,
                      fountainHome: const FountainHome(),
                      homeIcon: Icons.lightbulb_outline),
                  HomePageButtonWidget(
                      context: context,
                      printerHome: const PrinterHome(),
                      homeIcon: Icons.print),
                ],
              ),
              Row(
                children: [
                  HomePageButtonWidget(
                      context: context,
                      homeIcon: Icons.emoji_people,
                      tourHome: const TourHome()),
                  HomePageButtonWidget(
                      context: context,
                      homeIcon: Icons.settings_outlined,
                      optionsHome: const OptionsHome()),
                ],
              ),
            ],
          )),
      // bottomNavigationBar: bottomNavigation(),
    );
  }
}
