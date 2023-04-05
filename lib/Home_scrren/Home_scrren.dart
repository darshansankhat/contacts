import 'dart:io';

import 'package:contacts/Home_scrren/Call_scrren.dart';
import 'package:contacts/Model_class/Contact_modal.dart';
import 'package:flutter/material.dart';

List<Contact> ContactList = [
  Contact(
      name: "Darshan Kumbhani",
      con: "7046459707",
      img: "assets/image/contact/c1.jpg",
      vivek: false),
  Contact(
      name: "Kaushik ",
      con: "7041460635",
      img: "assets/image/contact/c2.jpg",
      vivek: false),
  Contact(
      name: "Vidit sir ",
      con: "7046632531",
      img: "assets/image/contact/c3.jpg",
      vivek: false),
  Contact(
      name: "Prince",
      con: "9725381787",
      img: "assets/image/contact/c4.jpg",
      vivek: false),
  Contact(
      name: "Vivek",
      con: "9106619178",
      img: "assets/image/contact/c5.jpg",
      vivek: false),
  Contact(
      name: "Krunal",
      con: "9998395274",
      img: "assets/image/contact/c6.jpg",
      vivek: false),
  Contact(
      name: "Yesh",
      con: "7046459707",
      img: "assets/image/contact/c7.jpg",
      vivek: false),
  Contact(
      name: "Dixit",
      con: "9512889686",
      img: "assets/image/contact/c8.jpg",
      vivek: false),
  Contact(
      name: "Bhargav",
      con: "9898637200",
      img: "assets/image/contact/c9.jpg",
      vivek: false),
];

class Contact_scrren extends StatefulWidget {
  const Contact_scrren({Key? key}) : super(key: key);

  @override
  State<Contact_scrren> createState() => _Contact_scrrenState();
}

class _Contact_scrrenState extends State<Contact_scrren> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //top
                  SizedBox(height: 60),
                  Text(
                    "Contacts",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  //search
                  SizedBox(height: 60),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(500),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: "Search....",
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black38),
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: Colors.black38,
                            )),
                      ),
                    ),
                  ),
                  //my details
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade100),
                    child: ListTile(
                      title: Text(
                        "Darshan Sankhat",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900),
                      ),
                      subtitle: Text(
                        "My Details",
                        style: TextStyle(color: Colors.black),
                      ),
                      leading: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 2),
                        ),
                        child: Image.asset("assets/image/m1.png"),
                      ),
                    ),
                  ),
                  //my Contacts
                  SizedBox(height: 25),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "My Contacts",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  //CONTACTS
                  SizedBox(height: 25),
                  Column(
                    children: ContactList.asMap()
                        .entries
                        .map(
                          (e) => InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "Call",
                                        arguments: e.key)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
                              child: contactList(ContactList[e.key], e.key)),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget contactList(Contact c1, index) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blue.shade100),
      child: ListTile(
        title: Text(
          "${c1.name}",
          style: TextStyle(fontSize: 18, color: Colors.blue.shade900),
        ),
        subtitle: Text(
          "${c1.con}",
          style: TextStyle(color: Colors.black),
        ),
        leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue.shade900, width: 2),
              color: Colors.white,
            ),
            child: c1.vivek == true
                ? CircleAvatar(
                    backgroundImage: FileImage(File("${c1.img}")),
                  )
                : CircleAvatar(
                    backgroundImage: AssetImage("${c1.img}"),
                    backgroundColor: Colors.white,
                  )),
        trailing: ContactList[index].kaushik == true
            ? Icon(
                Icons.star,
                color: Colors.blue,
              )
            : Icon(
                Icons.star,
                color: Colors.blue.shade100,
              ),
      ),
    );
  }
}
