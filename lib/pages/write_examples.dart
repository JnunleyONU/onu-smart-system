import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:onu_smart/constants.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:onu_smart/pages/tour_guide.dart';

class WriteExamples extends StatefulWidget {
  const WriteExamples({super.key});

  @override
  State<WriteExamples> createState() => _WriteExamplesState();
}

class _WriteExamplesState extends State<WriteExamples> {
  // ignore: unused_field
  late DatabaseReference _ref; // Declare _ref as a late variable

  @override
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .ref()
        .child('files/cgYjW3pM9bGO5CgccM0b'); // Correct the initialization
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Export Groups'),
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
                child: const Text('Export'),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

Future sendEmail() async {
  String username = 'zkremp418@gmail.com';
  String password = 'frfz vsic drju auws';

  final smtpServer = gmail(username, password);

  final message1 = Message()
    ..from = Address(username, 'JLK Smart App')
    ..recipients.add('z-krempasky@onu.edu')
    ..subject = 'Final Tour Groups';


  /*for (int i = 0; i < masterTourGuideObjectList.length; i++) {
    message1.recipients.add(masterTourGuideObjectList[i].email);
  }*/

  String masterGroups = '';
  for (int index1 = 0; index1 < masterTourGuideObjectList.length; index1++) {
    masterGroups +=
        "Faculty ${index1 + 1}: ${masterTourGuideObjectList[index1].name}: ${masterTourGuideObjectList[index1].major}\n";

    for (int index2 = 0;
        index2 < masterTourGuideObjectList[index1].studentsInTour.length;
        index2++) {
      masterGroups +=
          "Student ${index2 + 1}: ${masterTourGuideObjectList[index1].studentsInTour[index2].name}: ${masterTourGuideObjectList[index1].studentsInTour[index2].major}\n";
    }
  }
  message1.text = masterGroups;

  var connection = PersistentConnection(smtpServer);

  await connection.send(message1);
  await connection.close();

  //This next portion of code is to send the tour guides their individual groups

  for (int i = 0; i < masterTourGuideObjectList.length; i++) {
    var professor = masterTourGuideObjectList[i];
    var message = Message()
      ..from = Address(username, 'JLK Smart App')
      ..subject = 'Tour Groups for ${professor.name}'
      ..recipients.add(professor.email);

    String individualGroups = '';

    for (int j = 0; j < professor.studentsInTour.length; j++) {
      var student = professor.studentsInTour[j];
      individualGroups +=
          "Student ${j + 1}: ${student.name}, Major: ${student.major}\n";
    }

    message.text = individualGroups;

    try {
      var connection = PersistentConnection(smtpServer);
      await connection.send(message);
      await connection.close();
      print('Email sent to ${professor.email}');
    } catch (e) {
      print('Error sending email to ${professor.email}: $e');
    }
  }
}