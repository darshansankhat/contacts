import 'dart:io';

import 'package:contacts/Home_scrren/Home_scrren.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp/whatsapp.dart';

bool a = true;

class Call_scrren extends StatefulWidget {
  const Call_scrren({Key? key}) : super(key: key);

  @override
  State<Call_scrren> createState() => _Call_scrrenState();
}

class _Call_scrrenState extends State<Call_scrren> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtcon = TextEditingController();

  WhatsApp whatsapp = WhatsApp();

  String? img;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;



    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //top
                SizedBox(height: 60),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "Contacts",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                    //edit
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Edit Contact"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //image
                                  Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                          border: Border.all(
                                              color: Colors.blue.shade900,
                                              width: 2)),
                                      child: ContactList[index].vivek == true
                                          ? CircleAvatar(
                                              backgroundImage: FileImage(File(
                                                  "${ContactList[index].img}")),
                                            )
                                          : CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  "${ContactList[index].img}"),
                                            )),
                                  //Image Picker
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            ContactList[index].vivek=true;
                                            ImagePicker i1 = ImagePicker();
                                            XFile? xfile = await i1.pickImage(
                                                source: ImageSource.camera);
                                            setState(() {
                                              img = xfile!.path;
                                              ContactList[index].img=img;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.camera_alt_rounded,
                                            size: 35,
                                            color: Colors.blue,
                                          )),
                                      IconButton(
                                          onPressed: () async {
                                            ContactList[index].vivek=true;
                                            ImagePicker i1 = ImagePicker();
                                            XFile? xfile = await i1.pickImage(
                                                source: ImageSource.gallery);
                                            setState(() {
                                              img = xfile!.path;
                                              ContactList[index].img=img;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.photo,
                                            size: 35,
                                            color: Colors.blue,
                                          )),
                                    ],
                                  ),
                                  //name
                                  SizedBox(height: 20),
                                  TextFormField(
                                    controller: txtname = TextEditingController(
                                        text: "${ContactList[index].name}"),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      label: Text(
                                        "Name",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  //Contact
                                  SizedBox(height: 20),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: txtcon = TextEditingController(
                                        text: "${ContactList[index].con}"),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2),
                                      ),
                                      label: Text(
                                        "Number",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                  //Button
                                  SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        ContactList[index].name = txtname.text;
                                        ContactList[index].con = txtcon.text;
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: Text("Update"),
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber),
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.edit_square,
                        size: 30,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                //contact
                SizedBox(height: 100),
                Stack(
                  alignment: Alignment(0, -2),
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(20)),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          //Name
                          SizedBox(height: 100),
                          Text(
                            "${ContactList[index].name}",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.blue.shade600,
                                fontWeight: FontWeight.bold),
                          ),
                          //Number
                          SizedBox(height: 20),
                          Text(
                            "${ContactList[index].con}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          //Icons
                          SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    String link =
                                        "sms: ${ContactList[index].con}?body=Jo Baka Taklif To Rahvani  ";
                                    await launchUrl(Uri.parse(link));
                                  },
                                  icon: Icon(
                                    Icons.chat,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    String link =
                                        "tel: ${ContactList[index].con}";
                                    await launchUrl(Uri.parse(link));
                                  },
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.videocam,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                    //image
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.blue.shade900, width: 2)),
                        child: ContactList[index].vivek == true
                            ? CircleAvatar(
                                backgroundImage: FileImage(
                                    File("${ContactList[index].img}")),
                              )
                            : CircleAvatar(
                                backgroundImage:
                                    AssetImage("${ContactList[index].img}"),
                              )),
                  ],
                ),
                //option
                SizedBox(height: 20),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade50,
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            whatsapp.messagesTemplate(
                              to: 9106619178,
                            );
                          },
                          child: Text(
                            "    Send WhatsApp Message",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          )),
                      Divider(
                        height: 2,
                        color: Colors.blue,
                      ),
                      TextButton(
                          onPressed: () {
                            Share.share(
                                "Name: ${ContactList[index].name} \n Number: ${ContactList[index].con}");
                          },
                          child: Text(
                            "    Share Contact",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          )),
                      Divider(
                        height: 2,
                        color: Colors.blue,
                      ),
                      ContactList[index].kaushik == true
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  ContactList[index].kaushik = false;
                                });
                              },
                              child: Text(
                                "    Remove To Favorites",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              ))
                          : TextButton(
                              onPressed: () {
                                setState(() {
                                  ContactList[index].kaushik = true;
                                });
                              },
                              child: Text(
                                "    Add To Favorites",
                                style:
                                    TextStyle(fontSize: 18, color: Colors.blue),
                              ))
                    ],
                  ),
                ),
                //option2
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text(
                              "Are you Syouer To Delete Theis contact",
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black26,
                            content: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.black26,
                                        content: Text(
                                          "Contact Remove Successful",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                    ContactList.removeAt(index);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: Text("Yes"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("no"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                ),
                              ],
                            ));
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade50,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "    Delete Contact",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                ),
                //option3
                SizedBox(height: 20),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade50,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "    Block Contact",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
