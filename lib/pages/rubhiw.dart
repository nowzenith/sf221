import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf221/service/database_service.dart';

class rubhiw extends StatefulWidget {
  const rubhiw({super.key});
  @override
  State<rubhiw> createState() => _rubhiwState();
}

class _rubhiwState extends State<rubhiw> {
  String groupName = "";
  String des = "";
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    QuerySnapshot? snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getGroup();
    setState(() {
      groupName =
          snapshot!.docs[0]['groupName'][1].split(': ')[1].split('_')[0] +
              ' - ' +
              snapshot.docs[0]['groupName'][1].split(': ')[1].split('_')[1];
    });
    setState(() {
      des = snapshot?.docs[0]['show'];
    });

    await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
        .addMember(snapshot!.docs[0]['groupId']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 224, 153),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, left: 11),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 550,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 255, 255, 255),
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '  RUB HIW',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Image(
                    image: AssetImage('assets/Profile2.png'),
                    width: 150,
                    height: 150,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          groupName,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 150,
                    width: 230,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 250, 153, 104),
                    ),
                    child: Center(
                      child: Text(
                        des,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: 100.0,
                      height: 42.0,
                      child: TextButton(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text('Done',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800)),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 0, 0),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
      ]),
    );
  }
}
