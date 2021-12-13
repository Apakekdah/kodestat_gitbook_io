import 'package:flutter/material.dart';

/*void main() {
  runApp(
    const Center(
      child: Text('Hello, world!', textDirection: TextDirection.ltr),
    ),
  );
}
*/

void main(List<String> args) {
  runApp(const MaterialApp(
    title: "Hello World App",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World App'),
      ),
      body: const Center(
        child: Text('Hello, world!'),
      ),
    );
  }
}
