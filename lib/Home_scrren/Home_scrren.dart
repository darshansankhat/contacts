import 'package:contacts/Model_class/Contact_modal.dart';
import 'package:flutter/material.dart';

  List<Contact> ContactList=[
    Contact(name: "Darshan Kumbhani",con: "7046459707"),
    Contact(name: "Kaushik ",con: "7046459707"),
    Contact(name: "Vidit sir ",con: "7046459707"),
    Contact(name: "Prince",con: "7046459707"),
    Contact(name: "Vivek",con: "7046459707"),
    Contact(name: "Krunal",con: "7046459707"),
    Contact(name: "Yesh",con: "7046459707"),
    Contact(name: "Dixit",con: "7046459707"),
    Contact(name: "Bhargav",con: "7046459707"),
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
            padding: const EdgeInsets.only(left: 10,right: 10),
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
                        color: Colors.blue.shade100
                    ),
                    child: ListTile(
                      title: Text(
                        "Darshan Sankhat",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900),
                      ),
                      subtitle: Text("My Details",style: TextStyle(color: Colors.black),),
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
                    children: ContactList.asMap().entries.map((e) => contactList(ContactList[e.key])).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget contactList(Contact C1)
  {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade100
      ),
      child: ListTile(
        title: Text("${C1.name}",style: TextStyle(fontSize: 18,color: Colors.blue.shade900),),
        subtitle: Text("${C1.con}",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
