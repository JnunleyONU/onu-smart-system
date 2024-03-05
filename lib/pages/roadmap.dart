import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';
import 'package:onu_smart/pages/tour_guide.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({super.key});

  @override
  State<RoadMap> createState() => _RoadMap();
}

class _RoadMap extends State<RoadMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: onuOrange,
        appBar: generalAppBar("Tour Groupings"),
        body: Center(
          child: Container(
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
                child: SizedBox(
                    height: 800,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          // Padding(padding: EdgeInsetsGeometry.infinity),
                          buildRow([
                            'Location',
                            'Room',
                            'Description',
                            'Tour Guide Who Starts Here'
                          ]),

                          buildRow([
                            '1A',
                            '107',
                            "Dean's Suit",
                            masterTourGuideObjectList[0].name ?? "nothing "
                          ]),
                          buildRow([
                            '1B',
                            '115',
                            "Material's Lab",
                            masterTourGuideObjectList[1].name ?? "nothing "
                          ]),
                          buildRow([
                            '1C',
                            '117',
                            "Concrete Lab",
                            masterTourGuideObjectList[2].name ?? "nothing "
                          ]),
                          buildRow(['1D', '121', "Thermo Sciences Lab", ""]),
                          buildRow(['1E', '118', "Machine Shop", ""]),
                          buildRow(['1F', '', "Crown Innovation Ctr", ""]),
                          buildRow(['1G', '102', "Student Lounge", ""]),
                          buildRow(['2A', '207', "Computer Lounge", ""]),
                          buildRow(['2B', '207A', "One-button studio", ""]),
                          buildRow([
                            '2C',
                            '203-201',
                            "Freshman Engineering Complex",
                            ""
                          ]),
                          buildRow(['2D', '200', "Maker Space", ""]),
                          buildRow(['2E', '218', "Conference Room", ""]),
                          buildRow(['2F', '206', "Student Lounge", ""]),
                          buildRow([
                            '3A',
                            '',
                            '"Unique Huddle room," 3rd floor, top of stairs',
                            ""
                          ]),
                          buildRow([
                            '3B',
                            '320',
                            "Mechatronics demo in PLC lab",
                            ""
                          ]),
                          buildRow(['3C', '308', "Student Lounge", ""]),
                          buildRow(['3D', '307', "Computer teaching lab", ""]),
                          buildRow(['3E', '311', "Circuits lab", ""]),
                          buildRow([
                            '3F',
                            '301',
                            "Typical 40 person classroom with camera",
                            ""
                          ]),
                          buildRow([
                            '3G',
                            '323',
                            'Typical "Pod style" classroom',
                            ""
                          ]),

                          // buildRow(['Jared', '1', '2']),
                          // buildRow(['Jared', '1', '2']),
                          // buildRow(['Jared', '1', '2']),
                        ],
                      ),
                    )),
              )),
        ));
  }

  TableRow buildRow(List<String> cells) =>
      TableRow(children: cells.map((cell) => Text(cell)).toList());
  // TODO Add header mapping and padding
}
