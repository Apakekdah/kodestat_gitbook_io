import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _value = 0;

  void _add() => setState(() => _value++);
  void _remove() => setState(() => _value--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _add),
          IconButton(icon: const Icon(Icons.remove), onPressed: _remove)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(
                _value.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 37.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
