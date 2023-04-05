import 'package:flutter/material.dart';

class History_scrren extends StatefulWidget {
  const History_scrren({Key? key}) : super(key: key);

  @override
  State<History_scrren> createState() => _History_scrrenState();
}

class _History_scrrenState extends State<History_scrren> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text("History Scrren"),
      ),
    );
  }
}
