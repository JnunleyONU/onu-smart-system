import 'package:flutter/material.dart';
import 'package:onu_smart/constants.dart';

class TourGroupsPage extends StatefulWidget {
  const TourGroupsPage({super.key});

  @override
  State<TourGroupsPage> createState() => TourGroupsPageState();
}

class TourGroupsPageState extends State<TourGroupsPage> {
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
          child: Center(
            // child: GridView.count(
            //   crossAxisCount: 2,

            //   children: <Widget>[
            //     Container(
            //         color: Colors.teal,
            //         child: const Center(child: Text("this"))),
            //     Container(
            //         color: Colors.purple,
            //         child: const Center(child: Text("this"))),
            //     Container(
            //         color: Colors.pink,
            //         child: const Center(child: Text("this"))),
            //     Container(
            //         color: Colors.greenAccent,
            //         child: const Center(child: Text("this"))),
            //   ],
            // ),
            child: CustomScrollView(slivers: <Widget>[
              SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150.0,
                    // mainAxisSpacing: 10.0,
                    // crossAxisSpacing: 10.0,
                    // childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text('Grid Item $index'),
                      );
                    },
                    childCount: 1,
                  )),
              SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        color: Colors.red[100 * (index % 9)],
                        child: Text('Grid Item $index'),
                      );
                    },
                    childCount: 6,
                  ))
            ]),
          ),
        ));
  }
}
