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
  String _value = '';
  void _onClick(String value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
        backgroundColor: Colors.red,
      ),
      persistentFooterButtons: [
        // IconButton(
        //     onPressed: () => _onClick("Button 1"),
        //     icon: const Icon(Icons.timer)),
        // IconButton(
        //     onPressed: () => _onClick("Button 2"),
        //     icon: const Icon(Icons.people)),
        // IconButton(
        //     onPressed: () => _onClick("Button 3"), icon: const Icon(Icons.map))

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // pointnya disini
            children: [
              IconButton(
                  onPressed: () => _onClick("Button 1"),
                  icon: const Icon(Icons.timer)),
              IconButton(
                  onPressed: () => _onClick("Button 2"),
                  icon: const Icon(Icons.people)),
              IconButton(
                  onPressed: () => _onClick("Button 3"),
                  icon: const Icon(Icons.map))
            ],
          ),
        )
      ],
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [Text(_value)],
          ),
        ),
      ),
    );
  }
}
