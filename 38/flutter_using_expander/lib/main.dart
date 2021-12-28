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

//State is information of the application that can change over time or when some actions are taken.
class _MyAppState extends State<MyApp> {
  /*
  1. Create a directory called images and add your image there
  2. In pubspec.yamp add dependency for using assets
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            const Text("Image from asset"),
            /*
            We've created images directory in our Flutter app to store our 
            flutter.png used in this project and defined that in pubspec.yaml file
            assets:
              - images/flutter.png
            */
            Image.asset("images/flutter.png"),
            const Text("Image from network"),
            //this image was outside the screen so we are using Expanded which will fit the image into the screen
            Expanded(
                child: Image.network(
                    'https://static.makeuseof.com/wp-content/uploads/2012/10/flutter-logo.jpg'))
          ],
        ),
      ),
    );
  }
}
