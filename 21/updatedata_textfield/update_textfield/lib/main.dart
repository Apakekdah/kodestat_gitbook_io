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

  void onChanged(String value) {
    setState(() => _value = 'Change: $value');
  }

  void onSubmit(String value) {
    setState(() => _value = 'Submit: $value');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name here'),
      ),
      //hit Ctrl+space in intellij to know what are the options you can use in flutter widgets
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Hello',
                    hintText: 'Hint',
                    icon: Icon(Icons.people)),
                autocorrect: true,
                autofocus: true,
                //displaying number keyboard
                //keyboardType: TextInputType.number,
                //displaying text keyboard
                keyboardType: TextInputType.text,
                onChanged: onChanged,
                onSubmitted: onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
