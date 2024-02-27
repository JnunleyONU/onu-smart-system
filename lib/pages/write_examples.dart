import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:onu_smart/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:onu_smart/pages/student.dart';
import 'package:onu_smart/pages/tour_groups_page.dart';
import 'package:onu_smart/pages/tour_guide.dart';


class WriteExamples extends StatefulWidget {
  const WriteExamples({Key? key}) : super(key: key);

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  late DatabaseReference _ref; // Declare _ref as a late variable

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.ref().child('files/cgYjW3pM9bGO5CgccM0b'); // Correct the initialization
  }

  Future<void> writeToDatabase() async {
    // Example list of strings
    List<List<String>> list = [
      ["jerry", "bob", "joe"],
      ["alice", "eve", "charlie"],
    ];

    try {
      // Iterate over the list and push each string to the database
      for (List<String> sublist in list) {
        for (String value in sublist) {
          await _ref.push().set({'value': value});
        }
      }

      // Notify the user that the data has been uploaded
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data uploaded to Firebase'),
        ),
      );
    } catch (error) {
      // Handle any errors that occur during the data upload
      print('Error uploading data to Firebase: $error');
    }
  }

  Future<void> readFromDatabase() async {
    try {
      // Read data from the database
      DatabaseEvent event = await _ref.once();
      DataSnapshot dataSnapshot = event.snapshot;

      // Print the data to the console
      print('Data read from Firebase: ${dataSnapshot.value}');
    } catch (error) {
      // Handle any errors that occur during the data read
      print('Error reading data from Firebase: $error');
    }
  }

  Future sendEmail() async{
    String username ='zkremp418@gmail.com';
    String password ='frfz vsic drju auws';

    final smtpServer = gmail(username, password);

    String listTheStudents(List listOfStudentsByMajor) {
      List names = [];
      for (var element in listOfStudentsByMajor) {
        names.add(element.name);
      }
      return names.toString();
    }

  
    final message = Message()
      ..from = Address(username, 'Zach')
      ..recipients.add('z-krempasky@onu.edu')
      ..subject = 'Computer Engineering Students'
      ..text = 'Computer Engineering: ${listTheStudents(computerEngineeringStudents)}${listTheStudents(computerEngineeringTourGuides)}, Computer Science: ${listTheStudents(computerScienceStudents)}${listTheStudents(computerScienceTourGuides)}';

    var connection = PersistentConnection(smtpServer);

    await connection.send(message);
    await connection.close();
      /*  final user = await GoogleAuthApi.signIn();

      if (user == null) return;

      final email = user.email;
      final auth = await user.authentication;
      final token = auth.accessToken!;

      final smtpServer = gmailSaslXoauth2(email, token);
      final message = Message()
        ..from = Address(email, 'Zach')
        ..recipients = ['z-krempasky@onu.edu']
        ..subject = 'Hello'
        ..text = 'Test email';

      try{
        await send(message, smtpServer);
      }on MailerException catch (e){
        print(e);
      */
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Write and Read Test'),
        backgroundColor: onuOrange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: sendEmail,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Export File'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: readFromDatabase,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Read from Database'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}