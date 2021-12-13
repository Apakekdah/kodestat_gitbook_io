import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  String _value = 'Hello World';

  void _onPressed() {
    setState(() {
      _value = 'My name is Raunak';
    });
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
              //RaisedButton(onPressed: _onPressed, child: Text('Click me'))
              ElevatedButton(
                  onPressed: _onPressed, child: const Text('Click me')),
            ],
          ),
        ),
      ),
    );
  }
}
