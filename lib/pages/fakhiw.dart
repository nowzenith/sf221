import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf221/helper/helper_function.dart';
import 'package:sf221/pages/menu.dart';
import 'package:sf221/service/auth_service.dart';
import 'package:sf221/service/database_service.dart';
import 'package:sf221/widgets/widgets.dart';

class fakhiw extends StatefulWidget {
  const fakhiw({super.key});

  @override
  State<fakhiw> createState() => _fakhiwState();
}

class _fakhiwState extends State<fakhiw> {
  AuthService authService = AuthService();
  String username = "";
  String room = "";
  String building = "";
  String text = "";
  bool _isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    QuerySnapshot snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .gettingUserData(await HelperFunctions.getUserEmailSF() ?? '');

    setState(() {
      username = snapshot.docs[0]['username'];
      room = snapshot.docs[0]['room'];
      building = snapshot.docs[0]['building'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              reverse: true,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 11),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back_ios_new_rounded),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'FAK HIW',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/Profile2.png'),
                    width: 150,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$building - $room',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 30, left: 30, top: 0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 10,
                    maxLines: 10,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                    onChanged: (val) {
                      setState(() {
                        text = val;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0), width: 2.0),
                      ),
                      filled: true, //<-- SEE HERE
                      fillColor: Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                            width: 2, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      // labelText: 'User Name',

                      hintText: 'Enter your order.',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    width: 130.0,
                    height: 42.0,
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text('Submit',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 14,
                                fontWeight: FontWeight.w500)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 250, 153, 104),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      onPressed: () async {
                        if (text != "") {
                          setState(() {
                            _isLoading = true;
                          });
                        }
                        final new_text = text.split('\n').join(' ');
                        await DatabaseService(
                                uid: FirebaseAuth.instance.currentUser!.uid)
                            .createGroup(
                                FirebaseAuth.instance.currentUser!.uid,
                                new_text,
                                username + ": " + building + "_" + room,
                                text)
                            .whenComplete(() => _isLoading = false);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                        showSnackBar(context, Colors.green, "Order sent!");
                      },
                    ),
                  ),
                ),
              ]),
            ),
    );
  }
}
