import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const HomePage(), routes: <String, WidgetBuilder>{
    "/SecondPage": (BuildContext context) => const SecondPage()
  }));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Home Page"), backgroundColor: Colors.deepOrange),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.redAccent),
                  iconSize: 70.0,
                  onPressed: () {
                    Navigator.of(context).pushNamed("/SecondPage");
                  }),
              const Text("Home")
            ])));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Second Page"),
            backgroundColor: Colors.deepOrange),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
              IconButton(
                icon: Icon(Icons.home, color: Colors.blue),
                iconSize: 70.0,
                onPressed: null,
              ),
              Text("Second Page")
            ])));
  }
}
