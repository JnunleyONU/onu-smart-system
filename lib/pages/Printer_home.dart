

// Printer_home.dart - Written by Alexander Brown, Jared Swartz, Jamir Nunley, Zach Krempasky, Mallory Clark (IOT Titans Capstone Group)
// Last Update 3/26/2024
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
// Start Job : 'start' (Work in Progress, used for debug) (most likely wont be used in final product because file select allows print start as well)
// Select File: 'select' (will be used to select files and start prints, see documentation for details)
// Pause Job : 'pause'  (See documentation for additonal parameters)
// Resume Job : uses a variation of 'pause' command that include 'resume' as a secondary parameter
//
// Webcam Livestream (Runs constantly on page) : using the Webview Package we can observe webcam livestream by initializing the webpage of the 
// webcamera's specific address ( Webcam Address = http://$serverIP/webcam/?action=stream )
//
// See "Job Operations" on Octoprint REST API Documentation for details on JSON File encoding

//--------------------------------------------------------------------------------------------------------------------

//-------------------------------------- Notes------------------------------------------------------------------------
// In order to access the webcam livestream the following paramteter needed to be added to the file "AndroidManifest.xml" :

//<application
//        android:usesCleartextTraffic="true"
//        ...

// Still need to confirm functionallity on IOS Devices because they have a different manifest file
// DO NOT REMOVE THIS BECAUSE THE CONNECTION WILL NOT WORK OTHERWISE
//-------------------------------------------------------------------------------------------------------------------

//------------------------------------------TO DO-------------------------------------------------------------------
//
//Implement Function that fetches the printer's current status and displays it
//i.e: Print Status + what is being printed (retrieve Job status from http request) (Might be redundant because the user can see a webcam livestream)
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
//  "PolarBear3D.gcode" - Low Poly 3D Polar Bear
//
//
//
//-----------------------------------------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

// Global Variables
String serverIP = "192.168.23.241"; // IP address of current OctoPrint server
String apiKey = "0D6B765B66C94A75B89233E93946C0EA"; // API key for server control

class PrinterHome extends StatefulWidget {
 const PrinterHome({super.key});

 @override
 _PrinterHomeState createState() => _PrinterHomeState();
}

class _PrinterHomeState extends State<PrinterHome> {
 @override
 Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
        child: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: 'http://$serverIP/webcam/?action=stream',
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
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

//Resumes Job
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
