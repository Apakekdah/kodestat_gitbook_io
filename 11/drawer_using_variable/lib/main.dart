import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class SandyShores extends StatelessWidget {
  static String routeName = "sandyShores";

  const SandyShores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("You've landed on the Sandy Shores!"),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routes = <String, WidgetBuilder>{
      SandyShores.routeName: (BuildContext context) => const SandyShores(),
    };

    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Homepage'),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title = "Title"}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var headerText = const Text('Headers');

    var header = DrawerHeader(child: headerText);

    var item1Text = const Text('Sandy Shores');

    var item1Icon = const Icon(Icons.settings);

    var item1 =
        ListTile(title: item1Text, leading: item1Icon, onTap: _onItem1OnTap);

    var children = [header, item1];

    var listView = ListView(children: children);

    var drawer = Drawer(child: listView);

    return Scaffold(
      drawer: drawer,
      appBar: AppBar(
        title: const Text('Tabs Demo'),
      ),
      body: const Center(
        child: Text(''),
      ),
    );
  }

  void _onItem1OnTap() {
    Navigator.popAndPushNamed(context, SandyShores.routeName);
  }
}
