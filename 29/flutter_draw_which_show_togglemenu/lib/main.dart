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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Name Here"),
          backgroundColor: Colors.red,
        ),
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Text("Hello Drawer"),
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"))
              ],
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: const [Text("Add Widgets Here")],
            ),
          ),
        ));
  }
}
