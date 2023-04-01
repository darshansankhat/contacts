import 'package:contacts/Home_scrren/Home.dart';
import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" :(context) => Home(),
        "Home" :(context) => Contact_scrren(),
      },
    )
  );
}