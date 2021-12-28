import 'package:flutter/material.dart';

class Texty extends StatelessWidget {
  const Texty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("It's works"),
    );
  }
}

class MyExploreWidget extends StatelessWidget {
  const MyExploreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var assetImage = const AssetImage("assets/explorer.png");
    var assetImage2 = const AssetImage("assets/2.0x/explorer.png");
    var image = new Image(image: assetImage, width: 48.0, height: 48.0);
    return Container(child: image);
  }
}
