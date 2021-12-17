import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _showBottom() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Some info data",
                  style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"))
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              const Text("Add widgets here"),
              ElevatedButton(
                  onPressed: _showBottom, child: const Text("Click Me"))
            ],
          ),
        ),
      ),
    );
  }
}
