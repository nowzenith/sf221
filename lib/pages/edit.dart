import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf221/pages/profile.dart';
import 'package:sf221/service/auth_service.dart';
import 'package:sf221/service/database_service.dart';
import 'package:sf221/widgets/widgets.dart';

class edit extends StatefulWidget {
  edit(
      {super.key,
      required this.username,
      required this.building,
      required this.room,
      required this.telephone});
  String username = '';
  String building = '';
  String room = '';
  String telephone = '';
  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  String username = '';
  String building = '';
  String room = '';
  String telephone = '';
  AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    username = widget.username;
    building = widget.building;
    room = widget.room;
    telephone = widget.telephone;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: <Widget>[
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
            Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/Profile2.png'),
                width: 150,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30, top: 0),
              child: TextFormField(
                style: TextStyle(fontSize: 13),
                onChanged: (val) {
                  setState(() => username = val);
                },
                initialValue: username,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                        width: 2, color: Color.fromARGB(255, 255, 85, 0)),
                  ),
                  // labelText: 'User Name',

                  hintText: 'Username',
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 15),
              child: TextFormField(
                style: TextStyle(fontSize: 13),
                onChanged: (val) {
                  setState(() => building = val);
                },
                initialValue: building,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                        width: 2, color: Color.fromARGB(255, 255, 85, 0)),
                  ),
                  // labelText: 'User Name',

                  hintText: 'Building',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 5),
              child: TextFormField(
                style: TextStyle(fontSize: 13),
                onChanged: (val) {
                  setState(() => room = val);
                },
                initialValue: room,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                        width: 2, color: Color.fromARGB(255, 255, 85, 0)),
                  ),
                  // labelText: 'User Name',

                  hintText: 'Room',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 5),
              child: TextFormField(
                style: TextStyle(fontSize: 13),
                onChanged: (val) {
                  setState(() => telephone = val);
                },
                initialValue: telephone,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                        width: 2, color: Color.fromARGB(255, 255, 85, 0)),
                  ),
                  // labelText: 'User Name',

                  hintText: 'Telephone',
                ),
              ),
            ),
            Container(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Container(
                width: 130.0,
                height: 42.0,
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text('Edit',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 250, 153, 104),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                  onPressed: () async {
                    await DatabaseService(
                            uid: FirebaseAuth.instance.currentUser!.uid)
                        .editingUserData(username, building, room, telephone);
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => profile()));
                    showSnackBar(context, Colors.green, "Edit Success");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
