import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sf221/pages/chatpage.dart';
import 'package:sf221/service/database_service.dart';

class GroupTile extends StatefulWidget {
  const GroupTile({Key? key, required this.groupId}) : super(key: key);
  final String groupId;

  @override
  State<GroupTile> createState() => _GroupTileState();
}

class _GroupTileState extends State<GroupTile> {
  String groupName = "";
  String des = "";
  String recent = "";
  String sub = "";
  bool is_member = false;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    QuerySnapshot snapshot =
        await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .getGroupData(widget.groupId);

    if (FirebaseAuth.instance.currentUser!.uid == snapshot.docs[0]['admin']) {
      setState(() {
        groupName = "ฝากหิ้ว";
      });
    } else {
      setState(() {
        groupName = snapshot.docs[0]['groupName'][1];
        is_member = true;
      });
    }
    sub = snapshot.docs[0]['groupName'][0];
    des = snapshot.docs[0]['show'];
    recent = snapshot.docs[0]['recentMessage'];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => chatpage(
              groupName: groupName,
              groupId: widget.groupId,
              des: des,
              user: FirebaseAuth.instance.currentUser!.uid,
              is_member: is_member,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage('assets/Profile2.png'),
          ),
          title: Text(groupName),
          subtitle: Text(sub),
        ),
      ),
    );
  }
}
