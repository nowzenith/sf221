import 'package:flutter/material.dart';
import 'package:sf221/pages/fakhiw.dart';
import 'package:sf221/pages/rubhiw.dart';

class role extends StatefulWidget {
  const role({super.key});

  @override
  State<role> createState() => _roleState();
}

class _roleState extends State<role> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 10, left: 11, bottom: 20),
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
          child: Text(
            'DEK RUB HIW',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 175,
          width: 175,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => rubhiw()));
            },
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/RUBHIW.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: Text(
            '............................................................',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        Container(
          height: 175,
          width: 175,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => fakhiw()));
            },
            child: Ink(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/FAKHIW.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
