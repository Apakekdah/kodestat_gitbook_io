import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_listviewbuilder_with_refresh_indicator/models.dart';

void main() {
  runApp(const MyApp());
}

final ThemeData _themeData = ThemeData(
  primaryColor: Colors.blue,
);

/// Root MaterialApp
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var _routes = <String, WidgetBuilder>{
      "/todos": (BuildContext context) => const TodosPage(),
      // add another page,
    };
    return MaterialApp(
      title: "My App",
      theme: _themeData,
      home: const HomePage(),
      routes: _routes,
    );
  }
}

/// place: "/"
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Home Page")),
      body: ElevatedButton(
        child: const Text("My Todos"),
        onPressed: _onPressed,
      ),
    );
  }

  void _onPressed() {
    Navigator.of(context).pushNamed("/todos");
  }
}

/// place: "/todos"
class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Todos")),
      body: RefreshIndicator(
        child: ListView.builder(itemBuilder: _itemBuilder),
        onRefresh: _onRefresh,
      ),
    );
  }

  Future _onRefresh() {
    Completer completer = Completer();
    Timer timer = Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Todo todo = getTodo(index);
    return TodoItemWidget(todo: todo);
  }

  Todo getTodo(int index) {
    return Todo(false, "Todo $index");
  }
}

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({Key? key, this.todo}) : super(key: key);

  final Todo? todo;

  @override
  _TodoItemWidgetState createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text("-"),
      title: Text(widget.todo!.name),
      onTap: _onTap,
    );
  }

  void _onTap() {
    Route route = MaterialPageRoute(
      settings: const RouteSettings(name: "/todos/todo"),
      builder: (BuildContext context) => TodoPage(todo: widget.todo!),
    );
    Navigator.of(context).push(route);
  }
}

/// place: "/todos/todo"
class TodoPage extends StatefulWidget {
  const TodoPage({Key? key, this.todo}) : super(key: key);

  final Todo? todo;

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    var _children = <Widget>[
      Text("finished: " + widget.todo!.finished.toString()),
      Text("name: " + widget.todo!.name),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("My Todo")),
      body: Column(
        children: _children,
      ),
    );
  }
}
