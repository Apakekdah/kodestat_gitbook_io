import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Bottom Nav',
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Bottom Nav')),
        body: Container(),
        bottomNavigationBar: BottomNav(
          navCallback: (i) => print("Navigating to $i"),
        ),
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> navCallback;

  const BottomNav({Key? key, required this.navCallback, this.initialIndex = 0})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
    notifyCallback();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 8.0,
      child: SizedBox(
        height: 56.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButton(0, Icons.home, "Home"),
            _buildButton(1, Icons.book, "Bookmarks"),
            _buildButton(2, Icons.video_library, "Videos"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, IconData data, String tooltip) {
    return Flexible(
      flex: 1,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: () => onButtonTap(index),
          child: Center(
            child: Icon(
              data,
              color: _selected == index ? Colors.red : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  onButtonTap(int index) {
    setState(() {
      _selected = index;
    });
    notifyCallback();
  }

  notifyCallback() {
    widget.navCallback(_selected);
  }
}
