import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int i=-0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: IndexedStack(
            index: i,
            children: [
              Contact_scrren(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(onTap: () {
                i=0;
              },child: Icon(Icons.home,size: 30)),
              Icon(Icons.person_add_sharp,size: 30),
              Icon(Icons.history,size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
