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
  //List is basically an array
  final List _pets = ['Dogs', 'Cats', 'Fish', 'Turtle'];

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
              const Text("Pets", style: TextStyle(fontWeight: FontWeight.bold)),
              /*Listview diplay rows for different widgets,
              Listview.builder automatically builds its child widgets with a
              template and a list*/
              Expanded(
                child: ListView.builder(
                    itemCount: _pets.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Text(_pets.elementAt(index)),
                          const Divider()
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
