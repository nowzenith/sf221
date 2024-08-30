import 'package:flutter/material.dart';
import 'package:sf221/pages/chat.dart';
import 'package:sf221/pages/dekzonehai.dart';
import 'package:sf221/pages/fakhiw.dart';
import 'package:sf221/pages/profile.dart';
import 'package:sf221/pages/role.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 153, 104),
              border: Border(
                bottom: BorderSide(
                  //                   <--- left side
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'MENU',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 156,
            width: 350,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 175,
            width: 350,
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => role()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/RUBHIWSERVICE.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 156,
            width: 350,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => chat()));
              },
              child: Ink(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Chat.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 153, 104),
              border: Border(
                top: BorderSide(
                  //                   <--- left side
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'DEK RUB HIW',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
