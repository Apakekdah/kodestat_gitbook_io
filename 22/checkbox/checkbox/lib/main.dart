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
  bool _value1 = false;
  bool _value2 = false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
  void value1Changed(bool? value) => setState(() => _value1 = value ?? false);
  void value2Changed(bool? value) => setState(() => _value2 = value ?? false);

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
              Checkbox(value: _value1, onChanged: value1Changed),
              CheckboxListTile(
                value: _value2,
                onChanged: value2Changed,
                title: const Text('Hello World'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: const Text('Subtitle'),
                secondary: const Icon(Icons.archive),
                activeColor: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
