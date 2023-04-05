import 'dart:io';

import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:contacts/Model_class/Contact_modal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add_contact extends StatefulWidget {
  const Add_contact({Key? key}) : super(key: key);

  @override
  State<Add_contact> createState() => _Add_contactState();
}

class _Add_contactState extends State<Add_contact> {
  String? img;

  TextEditingController txtname = TextEditingController();
  TextEditingController txtcon = TextEditingController();

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "New Contact",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            ),
            actions: [
              InkWell(
                onTap: () {
                  if (txtkey.currentState!.validate()) {
                    String name = txtname.text;
                    String con = txtcon.text;
                    String? imge = img;

                    Contact contact = Contact(name: name, img: imge==null?"assets/image/m1.png":imge, con: con,vivek: imge==null?false:true);
                    ContactList.add(contact);

                    txtname.clear();
                    txtcon.clear();
                    img=null;

                    ScaffoldMessenger.of(context)!.showSnackBar(
                      SnackBar(
                        content: Text("Contact Save Successful"),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.black26,
                      ),
                    );
                  }
                },
                child: Icon(
                  Icons.done,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Column(
                  children: [
                    //image
                    SizedBox(height: 60),
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(

                          context: context,
                          builder: (context) {
                            return BottomSheet(
                              onClosing: () {},
                              builder: (context) {
                                return Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      color: Colors.blue),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //text
                                      Text(
                                        "Choice Image",
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      //file
                                      TextButton(
                                          onPressed: () async {
                                            ImagePicker i1 = ImagePicker();
                                            XFile? xfile = await i1.pickImage(
                                                source: ImageSource.gallery);
                                            setState(() {
                                              img = xfile!.path;
                                            });
                                          },
                                          child: Text(
                                            "From File",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          )),
                                      //camera
                                      TextButton(
                                          onPressed: () async {
                                            ImagePicker i1 = ImagePicker();
                                            XFile? xfile = await i1.pickImage(
                                                source: ImageSource.camera);
                                            setState(() {
                                              img = xfile!.path;
                                            });
                                          },
                                          child: Text(
                                            "From Camera",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: img == null
                              ? Icon(
                                  Icons.add,
                                  size: 50,
                                  color: Colors.white,
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(File("$img")),
                                )),
                    ),
                    //name
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter The Name";
                                }
                              },
                              controller: txtname,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                label: Text(
                                  "Name",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Contact
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.phone,
                            size: 35,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              controller: txtcon,
                              validator: (value) {
                                if (value!.length != 10) {
                                  return "Please Enter Valid Number";
                                }
                              },
                              keyboardType: TextInputType.number,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue)),
                                label: Text(
                                  "Phone",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
