import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  final String pageText;

  const OtherPage(this.pageText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageText)),
      body: Center(
        child: Text(pageText),
      ),
    );
  }
}
