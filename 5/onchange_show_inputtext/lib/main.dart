import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyTextInput()));
}

class MyTextInput extends StatefulWidget {
  const MyTextInput({Key? key}) : super(key: key);

  @override
  MyTextInputState createState() => MyTextInputState();
}

class MyTextInputState extends State<MyTextInput> {
  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Input Text"),
            backgroundColor: Colors.deepOrange),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextField(
                  decoration: const InputDecoration(hintText: "Type in here"),
                  //onChanged is called whenever we add or delete something on Text Field
                  onChanged: (String str) {
                    setState(() {
                      result = str;
                    });
                  }),
              //displaying input text
              Text(result)
            ])));
  }
}
