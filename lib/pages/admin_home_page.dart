import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/printer_home.dart';
import 'package:onu_smart/pages/tour_home.dart';
import 'package:onu_smart/pages/fountain_home.dart';
import 'package:onu_smart/pages/options_home.dart';

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
