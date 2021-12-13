import 'package:flutter/material.dart';

import './other_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  String otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";
  String networkImage =
      "https://orig00.deviantart.net/20eb/f/2015/030/6/f/_minflat__dark_material_design_wallpaper__4k__by_dakoder-d8fjqzu.jpg";
  String networkImage2 =
      "https://freedesignfile.com/upload/2018/11/Simple-and-elegant-flowers-drawing-background-vector-317.jpg";

  void switchUser() {
    String backupString = mainProfilePicture;
    setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Drawer App"),
          backgroundColor: Colors.redAccent,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                  accountName: const Text("Raunak Hajela"),
                  accountEmail: const Text("raunakhajela@gmail.com"),
                  currentAccountPicture: GestureDetector(
                    onTap: () => switchUser(),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(mainProfilePicture)),
                  ),
                  otherAccountsPictures: <Widget>[
                    GestureDetector(
                      onTap: () => print("this is the other user"),
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(otherProfilePicture)),
                    ),
                  ],
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(networkImage2)))),
              ListTile(
                  title: const Text("First Page"),
                  trailing: const Icon(Icons.arrow_upward),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const OtherPage("First Page")));
                  }),
              ListTile(
                  title: const Text("Second Page"),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const OtherPage("Second Page")));
                  }),
              const Divider(),
              ListTile(
                title: const Text("Close"),
                trailing: const Icon(Icons.cancel),
                onTap: () => Navigator.of(context).pop(),
              )
            ],
          ),
        ),
        body: const Center(
            child: Text("HomePage", style: TextStyle(fontSize: 35.0))));
  }
}

/**********************************************
***************Important Notes*****************
**********************************************/

//onTap: () => print("this is the other user")
// use this to display log messages on tap