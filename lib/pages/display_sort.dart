import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/tour_guide.dart';

class DisplaySort extends StatefulWidget {
  const DisplaySort({super.key});

  @override
  State<DisplaySort> createState() => _DisplaySortState();
}

class _DisplaySortState extends State<DisplaySort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onuOrange,
        appBar: generalAppBar("Tour Groupings"),
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
            child: SizedBox(
              height: 800,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: masterTourGuideObjectList.length,
                  itemBuilder: (BuildContext context, int index1) {
                    return Container(
                      height: 150,
                      color: Colors.white,
                      child: Center(
                          child: Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                TextSpan(
                                  text:
                                      "Faculty ${index1 + 1}: ${masterTourGuideObjectList[index1].name}: ${masterTourGuideObjectList[index1].major}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                          // Text(
                          //     "Faculty ${index1 + 1}: ${masterTourGuideObjectList[index1].name}"),
                          SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(8),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: masterTourGuideObjectList[index1]
                                      .studentsInTour
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return Container(
                                        height: 30,
                                        color: Colors.white,
                                        child: Text(
                                            "Student ${index2 + 1}: ${masterTourGuideObjectList[index1].studentsInTour[index2].name}: ${masterTourGuideObjectList[index1].studentsInTour[index2].major}"));
                                  }))
                          // ListView.builder()
                          // "Faculty $index: masterTourGuideObjectList[index]"),
                        ],
                      )),
                    );
                  }),
            )));
  }
}
