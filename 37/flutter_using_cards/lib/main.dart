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
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Card(
                color: Colors.green,
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: const [
                      Text("Hello World"),
                      Text("Hello How Are You")
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.blue,
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: const [
                      Text("Hello World"),
                      Text("Hello How Are You")
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.yellow,
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: const [
                      Text("Hello World"),
                      Text("Hello How Are You")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
