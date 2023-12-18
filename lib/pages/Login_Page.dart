import 'package:flutter/material.dart';
import 'package:onu_smart/widgets/default_banner.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: defaultbanner(context, "Login"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // Set the background color to orange
              foregroundColor: Colors.black, // Set the font color to black
            ),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

