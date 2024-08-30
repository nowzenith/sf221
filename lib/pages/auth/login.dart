import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf221/pages/auth/signup.dart';
import 'package:sf221/service/database_service.dart';
import 'package:sf221/widgets/widgets.dart';

import '../../helper/helper_function.dart';
import '../../service/auth_service.dart';
import '../menu.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String username = '';
  String password = '';
  bool _isLoading = false;
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : SingleChildScrollView(
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(
                      image: AssetImage('assets/icon1.png'),
                      width: 180,
                      height: 180,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 30, left: 30, bottom: 15, top: 50),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => username = val);
                    },
                    style: TextStyle(fontSize: 13),
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

                      hintText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    style: TextStyle(fontSize: 13),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12), // <-- SEE HERE
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
                            width: 2,
                            color: Color.fromARGB(255, 250, 153, 104)),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Container(
                    width: 130.0,
                    height: 42.0,
                    child: TextButton(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Text('Login',
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
                        setState(() {
                          _isLoading = true;
                        });
                        await authService
                            .loginUserWithEmailandPassword(username, password)
                            .then((value) async {
                          if (value == true) {
                            QuerySnapshot snapshot = await DatabaseService(
                                    uid: FirebaseAuth.instance.currentUser!.uid)
                                .gettingUserData(username);
                            //saving value to share preference
                            await HelperFunctions.saveUserLoggedInStatus(true);
                            await HelperFunctions.saveUserNameSF(
                                snapshot.docs[0]["username"]);
                            await HelperFunctions.saveUserEmailSF(
                                snapshot.docs[0]["email"]);

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          } else {
                            showSnackBar(context, Colors.red, value);
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: [
                      Container(
                        width: 130.0,
                        height: 42.0,
                        child: TextButton(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Register_Page()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
