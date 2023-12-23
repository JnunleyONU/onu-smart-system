import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onu_smart/pages/Home.dart';
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
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.data == null) {
                return const LoginPage();
              } else {
                return const HomePage();
              }
            } else {
              return const LoginPage();
            }
          }),
    );
  }
}
