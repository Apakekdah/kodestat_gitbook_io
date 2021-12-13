import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa
import 'package:path_provider/path_provider.dart'; //add path provider dart plugin on pubspec.yaml file

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController keyInputController = TextEditingController();
  TextEditingController valueInputController = TextEditingController();

  late File jsonFile;
  late Directory dir;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  late Map<String, dynamic> fileContent;

  @override
  void initState() {
    super.initState();
    jsonFile = File("/");
    dir = Directory("/");
    fileContent = {};
    /*to store files temporary we use getTemporaryDirectory() but we need
    permanent storage so we use getApplicationDocumentsDirectory() */
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
      }
    });
  }

  @override
  void dispose() {
    keyInputController.dispose();
    valueInputController.dispose();
    super.dispose();
  }

  void createFile(Map<String, String> content, Directory dir, String fileName) {
    print("Creating file!");
    File file = File(dir.path + "/" + fileName);
    file.createSync();
    fileExists = true;
    file.writeAsStringSync(jsonEncode(content));
  }

  void writeToFile(String key, String value) {
    print("Writing to file!");
    Map<String, String> content = {key: value};
    if (fileExists) {
      print("File exists");
      Map<String, dynamic> jsonFileContent =
          jsonDecode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(jsonEncode(jsonFileContent));
    } else {
      print("File does not exist!");
      createFile(content, dir, fileName);
    }
    setState(() => fileContent = jsonDecode(jsonFile.readAsStringSync()));
    print(fileContent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("JSON Tutorial"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const Text(
                "File content: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(fileContent.toString()),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              const Text("Add to JSON file: "),
              TextField(
                controller: keyInputController,
              ),
              TextField(
                controller: valueInputController,
              ),
              const Padding(padding: EdgeInsets.only(top: 20.0)),
              ElevatedButton(
                child: const Text("Add key, value pair"),
                onPressed: () => writeToFile(
                    keyInputController.text, valueInputController.text),
              )
            ],
          ),
        )
        /*body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          const Text(
            "File content: ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(fileContent.toString()),
          const Padding(padding: EdgeInsets.only(top: 10.0)),
          const Text("Add to JSON file: "),
          TextField(
            controller: keyInputController,
          ),
          TextField(
            controller: valueInputController,
          ),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          ElevatedButton(
            child: const Text("Add key, value pair"),
            onPressed: () =>
                writeToFile(keyInputController.text, valueInputController.text),
          )
        ],
      ),
      */
        );
  }
}
