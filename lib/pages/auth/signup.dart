import 'package:flutter/material.dart';
import 'package:sf221/helper/helper_function.dart';
import 'package:sf221/pages/auth/login.dart';
import 'package:sf221/pages/menu.dart';
import 'package:sf221/service/auth_service.dart';
import 'package:sf221/widgets/widgets.dart';

class Register_Page extends StatefulWidget {
  const Register_Page({super.key});

  @override
  State<Register_Page> createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  bool _isLoading = false;
  String username = '';
  String email = '';
  String password = '';
  String building = '';
  String room = '';
  String telephone = '';
  AuthService authService = AuthService();
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
                  padding: const EdgeInsets.only(top: 40),
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
                  padding: EdgeInsets.only(right: 30, left: 30, top: 30),
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
                      // labelText: 'User Name',

                      hintText: 'Username',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30, left: 30, top: 15),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    validator: (val) {
                      return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!)
                          ? null
                          : "Please provide a valid email";
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
                      // labelText: 'User Name',

                      hintText: 'Email',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    }),
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
                  padding:
                      EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 15),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => building = val);
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
                      // labelText: 'User Name',

                      hintText: 'Building',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 5),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => room = val);
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
                      // labelText: 'User Name',

                      hintText: 'Room',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(right: 30, left: 30, bottom: 10, top: 5),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() => telephone = val);
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
                      // labelText: 'User Name',

                      hintText: 'Telephone',
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
                        child: Text('Sign Up',
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
                            .registerUserWithEmailandPassword(username,
                                password, email, building, room, telephone)
                            .then((value) async {
                          if (value == true) {
                            await HelperFunctions.saveUserLoggedInStatus(true);
                            await HelperFunctions.saveUserNameSF(username);
                            await HelperFunctions.saveUserEmailSF(email);
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
                            "Login",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 0, 0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
