import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(InspirationApp());
}

class InspirationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InspirationMainPage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}

class InspirationMainPage extends StatefulWidget {
  @override
  _InspirationMainPageState createState() => _InspirationMainPageState();
}

class _InspirationMainPageState extends State<InspirationMainPage> {
  PageController _pageController = PageController(initialPage: 0);

  void navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        LoginPage(onLogin: () {
          navigateToPage(1); // Go to the Fountain of Inspiration page
        }),
        FountainOfInspirationPage(),
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  final VoidCallback onLogin;

  LoginPage({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                onLogin(); // Call the callback to navigate to the next page
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class FountainOfInspirationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fountain Of Inspiration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InspirationButton('Pink', 'http://jlk-statue.ad.onu.edu/pink'),
            InspirationButton('Christmas', 'http://jlk-statue.ad.onu.edu/christmas'),
            InspirationButton('Normal', 'http://jlk-statue.ad.onu.edu/normal'),
            InspirationButton('Blue', 'http://jlk-statue.ad.onu.edu/blue'),
          ],
        ),
      ),
    );
  }
}

class InspirationButton extends StatelessWidget {
  final String text;
  final String url;

  InspirationButton(this.text, this.url);

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: _launchURL,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.orange),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
