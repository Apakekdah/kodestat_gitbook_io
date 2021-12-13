import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
Android manifest :
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

Dependecies :
http: ^0.13.3
*/

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List? data;

  String uri = Uri.encodeFull("https://jsonplaceholder.typicode.com/posts");
  Future<String> getData() async {
    var response =
        await http.get(Uri.parse(uri), headers: {"Accept": "application/json"});

    setState(() {
      data = jsonDecode(response.body);
    });

    print(data?[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Listviews"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: data == null ? 0 : data?.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Text(data?[index]["title"]),
          );
        },
      ),
    );
  }
}
