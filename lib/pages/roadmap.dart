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
        appBar: generalAppBar("Road Map"),
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
                        child:
                            // DataTable(columnSpacing: 30, columns: const [
                            //   DataColumn(
                            //     label: Text(
                            //       'Location',
                            //       overflow: TextOverflow.ellipsis,
                            //     ),
                            //   ),
                            //   DataColumn(
                            //     label: Text('Room'),
                            //   ),
                            //   DataColumn(
                            //     label: Text('Description'),
                            //   ),
                            //   DataColumn(
                            //     label: Text('Tour Guide'),
                            //   ),
                            // ], rows: const [
                            //   DataRow(cells: [
                            //     DataCell(Text('1')),
                            //     DataCell(Text('Arshik')),
                            //     DataCell(Text('5644645')),
                            //     DataCell(Text('3')),
                            //   ])
                            // ])
                            //TODO This is a different method of creating the table that could look nicers but I don't have the time

                            ListView(children: [
                          Table(
                            border: TableBorder.all(),
                            children: [
                              buildRow([
                                'Location',
                                'Room',
                                'Description',
                                'Host',
                                'Tour Guide Who Starts Here'
                              ]),

                              buildRow([
                                '1A',
                                '107',
                                "Dean's Suit",
                                '',
                                tourGuidesWithAddedEmpties[0].name ?? "nothing "
                              ]),
                              buildRow([
                                '1B',
                                '115',
                                "Material's Lab",
                                '',
                                masterTourGuideObjectList[1].name
                              ]),
                              buildRow([
                                '1C',
                                '117',
                                "Concrete Lab",
                                '',
                                masterTourGuideObjectList[2].name
                              ]),
                              buildRow([
                                '1D',
                                '121',
                                "Thermo Sciences Lab",
                                '',
                                tourGuidesWithAddedEmpties[3].name
                              ]),
                              buildRow([
                                '1E',
                                '118',
                                "Machine Shop",
                                '',
                                tourGuidesWithAddedEmpties[4].name
                              ]),
                              buildRow([
                                '1F',
                                '',
                                "Crown Innovation Ctr",
                                '',
                                tourGuidesWithAddedEmpties[5].name
                              ]),
                              buildRow([
                                '1G',
                                '102',
                                "Student Lounge",
                                '',
                                tourGuidesWithAddedEmpties[6].name
                              ]),
                              buildRow([
                                '2A',
                                '207',
                                "Computer Lounge",
                                '',
                                tourGuidesWithAddedEmpties[7].name
                              ]),
                              buildRow([
                                '2B',
                                '207A',
                                "One-button studio",
                                '',
                                tourGuidesWithAddedEmpties[8].name
                              ]),
                              buildRow([
                                '2C',
                                '203-201',
                                "Freshman Engineering Complex",
                                '',
                                tourGuidesWithAddedEmpties[9].name
                              ]),
                              buildRow([
                                '2D',
                                '200',
                                "Maker Space",
                                '',
                                tourGuidesWithAddedEmpties[10].name
                              ]),
                              buildRow([
                                '2E',
                                '218',
                                "Conference Room",
                                '',
                                tourGuidesWithAddedEmpties[11].name
                              ]),
                              buildRow([
                                '2F',
                                '206',
                                "Student Lounge",
                                '',
                                tourGuidesWithAddedEmpties[12].name
                              ]),
                              buildRow([
                                '3A',
                                '',
                                '"Unique Huddle room," 3rd floor, top of stairs',
                                '',
                                tourGuidesWithAddedEmpties[13].name
                              ]),
                              buildRow([
                                '3B',
                                '320',
                                "Mechatronics demo in PLC lab",
                                '',
                                tourGuidesWithAddedEmpties[14].name
                              ]),
                              buildRow([
                                '3C',
                                '308',
                                "Student Lounge",
                                '',
                                tourGuidesWithAddedEmpties[15].name
                              ]),
                              buildRow([
                                '3D',
                                '307',
                                "Computer teaching lab",
                                '',
                                tourGuidesWithAddedEmpties[16].name
                              ]),
                              buildRow([
                                '3E',
                                '311',
                                "Circuits lab",
                                '',
                                tourGuidesWithAddedEmpties[17].name
                              ]),
                              buildRow([
                                '3F',
                                '301',
                                "Typical 40 person classroom with camera",
                                '',
                                tourGuidesWithAddedEmpties[18].name
                              ]),
                              buildRow([
                                '3G',
                                '323',
                                'Typical "Pod style" classroom',
                                '',
                                tourGuidesWithAddedEmpties[19].name
                              ]),

                              // buildRow(['Jared', '1', '2']),
                              // buildRow(['Jared', '1', '2']),
                              // buildRow(['Jared', '1', '2']),
                            ],
                          ),
                        ]))),
              )),
        ));
  }

  TableRow buildRow(List<String> cells) =>
      TableRow(children: cells.map((cell) => Text(cell)).toList());
  // TODO Add header mapping and padding
}
