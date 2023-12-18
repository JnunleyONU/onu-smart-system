import 'package:flutter/material.dart';
import 'package:onu_smart/pages/Options_Home.dart';
import 'package:onu_smart/pages/Printer_home.dart';
import 'package:onu_smart/pages/Tour_home.dart';
import 'package:onu_smart/pages/fountain_home.dart';
import 'package:onu_smart/widgets/default_banner.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultbanner(context, "Home"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FountainLargeButton('Fountain Control'),
            PrinterLargeButton('3D Print'),
            TourLargeButton('Smart Tour'),
            OptionsLargeButton('Options'),
          ],
        ),
      ),
    );
  }
}

class FountainLargeButton extends StatelessWidget {
  final String text;

  FountainLargeButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FountainHome(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}


class PrinterLargeButton extends StatelessWidget {
  final String text;

  PrinterLargeButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PrinterHome(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}


class TourLargeButton extends StatelessWidget {
  final String text;

  TourLargeButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TourHome(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

class OptionsLargeButton extends StatelessWidget {
  final String text;

  OptionsLargeButton(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const OptionsHome(),
            ),
          );
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}