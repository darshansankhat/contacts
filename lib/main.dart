import 'package:contacts/Home_scrren/Call_scrren.dart';
import 'package:contacts/Home_scrren/Home.dart';
import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:contacts/Splash/Splash_scrren.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        "/" :(context) => Home(),
        "splash":(context) => Splash_scrren(),
        "Home" :(context) => Contact_scrren(),
        "Call" :(context) => Call_scrren(),
      },
    )
  );
}