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
      //..recipients.add('z-krempasky@onu.edu')
      ..subject = 'Tour Groups';


      /*Once we add email to the excel sheet being imported and to the masterTourGuideObjectList, 
      we should be able to pull that using the same for loop style as below in order to dynamically send it to the professors signed up*/
      
      for(int i = 0; i < masterTourGuideObjectList.length; i++){
        message.recipients.add(masterTourGuideObjectList[i].email);
      }
      
      String groups = '';
      for(int index1 = 0; index1 < masterTourGuideObjectList.length; index1++){
        groups += "Faculty ${index1 + 1}: ${masterTourGuideObjectList[index1].name}: ${masterTourGuideObjectList[index1].major}\n";

        for(int index2 = 0; index2 < masterTourGuideObjectList[index1].studentsInTour.length; index2++){
          groups += "Student ${index2 + 1}: ${masterTourGuideObjectList[index1].studentsInTour[index2].name}: ${masterTourGuideObjectList[index1].studentsInTour[index2].major}\n";
        }
      }
      message.text = groups;
    
    /*final message2 = Message()
      ..from = Address(username, 'Zach')
      ..recipients.add('z-krempasky@onu.edu')
      ..subject = 'Your Tour Group';

      String students = '';
      for(int i = 0; i < masterTourGuideObjectList.length; i++){
        for(int j = 0; j < masterTourGuideObjectList[i].studentsInTour.length; j++){
            students += "Student ${j + 1}: ${masterTourGuideObjectList[i].studentsInTour[j].name}: ${masterTourGuideObjectList[i].studentsInTour[j].major}\n";
        }
      }
      message2.text = students;*/



    var connection = PersistentConnection(smtpServer);

    await connection.send(message);
    //await connection.send(message2);
    await connection.close();
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