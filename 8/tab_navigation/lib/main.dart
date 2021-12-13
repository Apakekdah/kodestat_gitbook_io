import 'package:flutter/material.dart';
import 'pages/first.dart' as first;
import 'pages/second.dart' as second;
import 'pages/third.dart' as third;

void main() {
  runApp(const MaterialApp(home: MyTabs()));
}

class MyTabs extends StatefulWidget {
  const MyTabs({Key? key}) : super(key: key);

  @override
  MyTabsState createState() => MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Pages"),
            backgroundColor: Colors.deepOrange,
            bottom: TabBar(controller: controller, tabs: const <Tab>[
              Tab(icon: Icon(Icons.arrow_forward)),
              Tab(icon: Icon(Icons.arrow_downward)),
              Tab(icon: Icon(Icons.arrow_back))
            ])),
        bottomNavigationBar: Material(
            color: Colors.deepOrange,
            child: TabBar(controller: controller, tabs: const <Tab>[
              Tab(icon: Icon(Icons.arrow_forward)),
              Tab(icon: Icon(Icons.arrow_downward)),
              Tab(icon: Icon(Icons.arrow_back))
            ])),
        body: TabBarView(controller: controller, children: const <Widget>[
          first.First(),
          second.Second(),
          third.Third()
        ]));
  }
}
