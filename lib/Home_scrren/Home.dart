import 'package:contacts/Home_scrren/Add_contact_scrren.dart';
import 'package:contacts/Home_scrren/History_scrren.dart';
import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int i=0;
  bool a=false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: i,
          children: [
            Contact_scrren(),
            Add_contact(),
            History_scrren(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: i,
          type: BottomNavigationBarType.shifting,
          onTap: (value) {
            setState(() {
              i=value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,size: 30,),label:"",activeIcon: Icon(Icons.home,size: 30,)),
            BottomNavigationBarItem(icon: Icon(Icons.person_add_alt_1,size: 30,),label:"",activeIcon: Icon(Icons.person_add_alt_1,size: 30,)),
            BottomNavigationBarItem(icon: Icon(Icons.history,size: 30,),label:"",activeIcon: Icon(Icons.history,size: 30,)),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}

// Container(
// height: 50,
// color: Colors.white,
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// InkWell(onTap: () {
// setState(() {
// i=0;
// });
// },child: Icon(Icons.home,size: i==0?35:30,color: i==0?Colors.blue:Colors.grey,)),
// InkWell(onTap: () {
// setState(() {
// i=1;
// });
// },child: Icon(Icons.person_add_alt_1,size: i==1?35:30,color: i==1?Colors.blue:Colors.grey,)),
// InkWell(onTap: () {
// setState(() {
// i=2;
// });
// },child: Icon(Icons.history,size: i==2?35:30,color: i==2?Colors.blue:Colors.grey,)),
// ],
// ),
// ),