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
  final GlobalKey<ScaffoldMessengerState> _scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  void _showBar() {
    var sb = const SnackBar(content: Text('Hello World'));
    _scaffoldState.currentState?.showSnackBar(sb);
    //ScaffoldMessenger.of(context).showSnackBar(sb);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        /*a key is a way of refrencing an actual widget, below we are making refrence
      of an object we created, it will be accessible across the entire application since
      we are creating a GlobalKey*/
        key: _scaffoldState,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Name Here"),
            backgroundColor: Colors.red,
          ),
          body: Container(
            padding: const EdgeInsets.all(32.0),
            child: Center(
              child: Column(
                children: [
                  const Text("Add widgets here"),
                  ElevatedButton(
                      onPressed: _showBar, child: const Text("Click Me"))
                ],
              ),
            ),
          ),
        ));
  }
}
