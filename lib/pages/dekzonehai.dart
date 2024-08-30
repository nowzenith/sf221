import 'package:flutter/material.dart';
import 'package:sf221/pages/fakhiw.dart';
import 'package:sf221/pages/rubhiw.dart';

class dekzonehai extends StatefulWidget {
  const dekzonehai({super.key});

  @override
  State<dekzonehai> createState() => _dekzonehaiState();
}

class _dekzonehaiState extends State<dekzonehai> {
  @override
  Widget build(BuildContext context) {
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
            'DEK ZONE NHAI?',
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => fakhiw()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => rubhiw()));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/4.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/5.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ]),
    );
  }
}
