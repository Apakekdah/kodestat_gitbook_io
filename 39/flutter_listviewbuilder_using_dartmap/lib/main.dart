import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

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
  //Map is basically a type of key/value pair in dart
  Map _countries = {};

  void _getData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() => _countries = jsonDecode(response.body));
      print('Loaded ${_countries.length} countries');
    }
  }

  @override
  void initState() {
    _getData();
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
            children: [
              const Text("Country",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              /*Listview diplay rows for different widgets,
              Listview.builder automatically builds its child widgets with a
              template and a list*/
              Expanded(
                child: ListView.builder(
                    itemCount: _countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = _countries.keys.elementAt(index);
                      return Row(
                        children: [Text("$key : "), Text(_countries[key])],
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
