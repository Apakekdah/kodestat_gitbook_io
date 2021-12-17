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
  late List<BottomNavigationBarItem> _items;
  String _value = '';
  int _index = 0;

  @override
  void initState() {
    _items = [
      const BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.weekend), label: "Weekend"),
      const BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message")
    ];
    super.initState();
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
            children: [Text(_value)],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        fixedColor: Colors.blue,
        currentIndex: _index,
        onTap: (int item) {
          //   _index = item;
          // _value = "Current value is: ${_index.toString()}";
          setState(() {
            _index = item;
            _value = "Current value is: ${_index.toString()}";
          });
        },
      ),
    );
  }
}
