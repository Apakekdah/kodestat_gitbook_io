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
  String _value = 'Hello World';

  void _onPress() {
    setState(() {
      _value = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name here"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
            child: Column(
          children: <Widget>[
            Text(_value),
            TextButton(
                onPressed: () => _onPress(), child: const Text("Click me"))
          ],
        )),
      ),
    );
  }
}
