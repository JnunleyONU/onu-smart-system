import 'package:flutter/material.dart';
import 'package:onu_smart/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'options/firebase_options.dart';

// void main() {
//   runApp(const InspirationApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const InspirationApp());
}

class InspirationApp extends StatelessWidget {
  const InspirationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
    );
  }
}
