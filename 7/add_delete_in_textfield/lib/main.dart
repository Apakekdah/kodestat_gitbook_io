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
  final TextEditingController controller = TextEditingController();

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
                  onSubmitted: (String str) {
                    setState(() {
                      result = result + '\n' + str;
                    });
                    controller.text = "";
                  },
                  controller: controller),
              //displaying input text
              Text(result)
            ])));
  }
}
