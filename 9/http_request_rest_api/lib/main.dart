import 'dart:async';
import 'dart:convert'; //it allows us to convert our json to a list

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
Di androidmanifest.xml tambahin
<uses-permission android:name="android.permission.INTERNET"/>

di pubspec.yaml tambahin dependencies :
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
  //this async func will get data from the internet
  //when our func is done we return a string
  Future getData() async {
    //we have to wait to get the data so we use 'await'
    String url = Uri.encodeFull("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(
        //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.parse(url),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        });

    //print(response.body);

    List data = jsonDecode(response.body);
    //print(data);
    print(data[1]["title"]); // it will print => title: "qui est esse"
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Stateful Widget!"),
            backgroundColor: Colors.deepOrange),
        body: Center(
            child: ElevatedButton(
                child: const Text("Get data!",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20.0)),
                onPressed: getData)));
  }
}
