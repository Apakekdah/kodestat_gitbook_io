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
  final TextEditingController _user = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name Here"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Please Login.."),
            Row(
              children: [
                const Text("Username"),
                /*this will give an error because TextField is infinite, you can type
                and type, it doesn't know where to stop and confuse Flutter but our
                screen width is limited o to solve this we use 'Expanded' widget
                controller is like an Android Cursor and we use it with TextField*/
                //new TextField(controller: _user,)
                Expanded(child: TextField(controller: _user))
              ],
            ),
            Row(
              children: [
                const Text("Password"),
                //obscureText changes text to dots for password fields
                Expanded(child: TextField(controller: _pass, obscureText: true))
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(32.0),
                //onPressed will show login with the username typed on terminal
                child: ElevatedButton(
                    onPressed: () => print("Login ${_user.text}"),
                    child: const Text("Click Me")))
          ],
        ),
      ),
    );
  }
}
