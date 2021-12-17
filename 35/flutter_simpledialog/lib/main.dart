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

enum Answers { YES, NO, MAYBE }

class _MyAppState extends State<MyApp> {
  String _value = "";

  void _setValue(String value) => setState(() => _value = value);

  Future askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Do you like Flutter?'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, Answers.YES),
                  child: const Text("Yes !!!")),
              TextButton(
                  onPressed: () => Navigator.pop(context, Answers.NO),
                  child: const Text("NO :(")),
              TextButton(
                  onPressed: () => Navigator.pop(context, Answers.MAYBE),
                  child: const Text("Maybe :|")),
            ],
          );
        })) {
      case Answers.YES:
        _setValue("Yes");
        break;
      case Answers.NO:
        _setValue("No");
        break;
      case Answers.MAYBE:
        _setValue("Maybe");
        break;
    }
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
              Text(_value),
              ElevatedButton(onPressed: askUser, child: const Text("Click Me"))
            ],
          ),
        ),
      ),
    );
  }
}
