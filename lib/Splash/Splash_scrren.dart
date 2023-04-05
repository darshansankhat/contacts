import 'package:flutter/material.dart';

class Splash_scrren extends StatefulWidget {
  const Splash_scrren({Key? key}) : super(key: key);

  @override
  State<Splash_scrren> createState() => _Splash_scrrenState();
}

class _Splash_scrrenState extends State<Splash_scrren> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3),() async {
      await Navigator.pushNamed(context, "/");
    });

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone_sharp,size: 100,color: Colors.blue,),
              Text("Contact App",style: TextStyle(fontSize: 30,color: Colors.blue),),
              SizedBox(height: 30),
              CircularProgressIndicator(backgroundColor: Colors.blue.shade50,color: Colors.blue)
            ],
          ),
        ),
      ),
    );
  }
}
