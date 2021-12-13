import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      //home: new Text("Cool")
      home: MyStatelessWidget()));
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Scaffold provide functionality of appbar, body of app etc
    return Scaffold(
        appBar: AppBar(title: const Text("Stateless Widget")),
        body: Container(
            //adding padding around card
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Text("Hey"),
                  // Text("My name"),
                  // Text("Is Raunak"),

                  MyCard(
                      title: const Text("I love Flutter",
                          style: TextStyle(fontSize: 20.0)),
                      icon: const Icon(Icons.favorite,
                          size: 40.0, color: Colors.redAccent)),
                  MyCard(
                      title: const Text("I love Donuts",
                          style: TextStyle(fontSize: 20.0)),
                      icon: const Icon(Icons.donut_large,
                          size: 40.0, color: Colors.brown)),
                  MyCard(
                      title: const Text("I see you",
                          style: TextStyle(fontSize: 20.0)),
                      icon: const Icon(Icons.visibility,
                          size: 40.0, color: Colors.blue)),
                ])));
  }
}

class MyCard extends StatelessWidget {
  //adding constructor
  MyCard({Key? key, this.title, this.icon}) : super(key: key);

  final Widget? title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        //adding bottom padding on card
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Card(
            child: Container(
                //adding padding inside card
                padding: const EdgeInsets.all(15.0),
                child: Column(children: <Widget>[
                  //Text("I love Flutter"),
                  //Icon(Icons.favorite)

                  title!,
                  icon!
                ]))));
  }
}
