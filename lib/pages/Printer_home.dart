

// Printer_home.dart - Written by Alexander Brown, Jared Swartz, Jamir Nunley, Zach Krempasky, Mallory Clark (IOT Titans Capstone Group)
// Last Update 2/4/2024
// Uses Octoprint REST Api to communicate with server, can either be connected to via domain name or hardcoded IP address
//
// [DUE TO NATURE OF ONU NETWORK IP ADDRESS MUST BE HARDCODED - DOMAIN NAMES CANNOT BE GIVEN]
//
// Future implementations should include a field where user can update servers IP address in event of network changes
//
// Octopi REST API documentation : https://docs.octoprint.org/en/master/api/index.html
// 

//--------------------------------------------General Usage-----------------------------------------------------------
// Basis for Operation: sends encoded JSON files to Octopi server to execute commands, current commands include;
//          
// Cancel Job : 'cancel' (WORKS)
// Start Job : 'start' (Work in Progress) (most likely wont be used in final product because file select allows print start as well)
// Select File: 'select' (will be used to select files and start prints, see documentation for details)
// Pause Job : 'pause' (WORKS) (See documentation for additonal parameters)
// 

// See "Job Operations" on Octoprint REST API Documentation for details on JSON File encoding
//-------------------------------------------------------------------------------------------------------------------

//------------------------------------------TO DO-------------------------------------------------------------------

// Implement Monitering feature, should allow user to view printer's webcam via webserver, also need to add function
// that fetches current job details to display
//
//Implement Function that fetches the printer's current status and displays it
//i.e: Print Status + what is being printed (retrieve Job status from http request)
//
//Add function that allows user to change server IP address and API Key if for any reason either of those needs to be changed (Maybe)
//
//------------------------------------------------------------------------------------------------------------------

//--------------------------Wishful Thinking -----------------------------------------------------------------------
// Allow user to upload files from their device to start print (will most likely not happen for this project but would be cool ya know?)
//------------------------------------------------------------------------------------------------------------------

//--------------------------Files Currently on Server -------------------------------------------------------------
//   Add the names of any files uploaded to the server, the name is what is passed into the select print function 
//  "PolarBearCapstone.gcode" - 2D Model of Polar Bear
//
//
//
//
//-----------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


//Global Variables
String serverIP = "192.168.23.241"; //Ip address of current octopi server
String apiKey = "0D6B765B66C94A75B89233E93946C0EA"; //api key that allows for application to control server without user authentication


//GUI for Printer Home page
class PrinterHome extends StatelessWidget {
  const PrinterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onuOrange,
      appBar: generalAppBar("Smart Printing"),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  //Start print function code

                  
                  selectPrint("PolarBearCapstone.gcode");

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Start Polar Bear 2D'),
              ),
              ElevatedButton(
                onPressed: () {
                  //pause print function code

                  pauseJob();



                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Pause Print'),
              ),
              ElevatedButton(
                onPressed: () {

                  resumeJob();

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Resume Print'),
              ),
              ElevatedButton(
                onPressed: () {

                  cancelJob();

                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: onuOrange, // Set the font color to black
                ),
                child: const Text('Cancel Print'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<http.Response> selectPrint(String filename) async {

  String address = "http://$serverIP/api/files/local/$filename";

  var url = Uri.parse(address);

  var headers = {
    "Content-Type" : "application/json",
    "X-Api-Key" : "0D6B765B66C94A75B89233E93946C0EA"
  };

  var send = json.encode({
  "command" : "select",
  "print" : true
  });

  var response = await http.post(url, headers: headers, body: send);

  return response;

}

//Not used in final implementation, used for debugging
Future<http.Response> startDemo() async{

String hostName = "http://192.168.23.241/api/files/local/PolarBearCapstone.gcode";

var url = Uri.parse(hostName);
var headers = {
  "Content-Type" : "application/json",
  "X-Api-Key" : "0D6B765B66C94A75B89233E93946C0EA"
};

//encoded json file that is sent
var send = json.encode({
"command" : "select",
"print" : true
});

var response = await http.post(url, headers: headers, body: send);

return response;

}

Future<http.Response> pauseJob() async {
  String urlName = "http://$serverIP/api/job";
 var url = Uri.parse(urlName);
 var headers = {
    "Content-Type": "application/json",
    "X-Api-Key": "0D6B765B66C94A75B89233E93946C0EA"
 };

 var body = json.encode({"command" : "pause",
                        "action" : "pause"});

 var response = await http.post(url, headers: headers, body: body);

 return response;
}

Future<http.Response> resumeJob() async {
  String urlName = "http://$serverIP/api/job";
 var url = Uri.parse(urlName);
 var headers = {
    "Content-Type": "application/json",
    "X-Api-Key": "0D6B765B66C94A75B89233E93946C0EA"
 };

 var body = json.encode({"command" : "pause",
                        "action" : "resume"});

 var response = await http.post(url, headers: headers, body: body);

 return response;
}

Future<http.Response> cancelJob() async {
  String domainName = "http://$serverIP/api/job";

  var url = Uri.parse(domainName);
   var headers = {
    "Content-Type": "application/json",
    "X-Api-Key": "0D6B765B66C94A75B89233E93946C0EA"
 };

  var body = json.encode({"command" : "cancel"});

 var response = await http.post(url, headers: headers, body: body);

 return response;
}
