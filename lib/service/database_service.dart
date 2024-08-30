import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({required this.uid});

  // reference to users collection
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  // reference to group collection
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('group');

  // saving user data
  Future savingUserData(String username, String email, String building,
      String room, String telephone) async {
    return await usersCollection.doc(uid).set({
      'username': username,
      'email': email,
      'building': building,
      'room': room,
      'telephone': telephone,
      'uid': uid,
      'groups': [],
    });
  }

  //get user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await usersCollection.where('email', isEqualTo: email).get();
    return snapshot;
  }

  //edit user data
  Future editingUserData(
      String username, String building, String room, String telephone) async {
    return await usersCollection.doc(uid).update({
      'username': username,
      'building': building,
      'room': room,
      'telephone': telephone,
    });
  }

  //get user group
  getUserGroup() async {
    return usersCollection.doc(uid).snapshots();
  }

  // create group
  Future createGroup(String id, String fak, String rub, String show) async {
    DocumentReference groupdocumentReference = await groupCollection.add({
      'groupName': [fak, rub],
      'description': fak,
      'show': show,
      'admin': id,
      'member': '',
      'groupId': "",
      'recentMessage': "",
      'recentMessageSender': "",
      'recentMessageTime': "",
      'created': FieldValue.serverTimestamp(),
    });

    await groupdocumentReference.update({
      'groupId': groupdocumentReference.id,
    });

    DocumentReference userDocumentReference = usersCollection.doc(uid);

    return await userDocumentReference.update({
      'groups': FieldValue.arrayUnion([groupdocumentReference.id]),
    });
  }

  // get group data
  Future getGroupData(String groupId) async {
    QuerySnapshot snapshot =
        await groupCollection.where('groupId', isEqualTo: groupId).get();
    return snapshot;
  }

  // getting the chat
  getChat(String groupId) async {
    return groupCollection
        .doc(groupId)
        .collection('messages')
        .orderBy('time')
        .snapshots();
  }

  // get group
  getGroup() async {
    QuerySnapshot snapshot = await groupCollection
        .orderBy('admin', descending: true)
        .where('member', isEqualTo: "")
        .where('admin', isNotEqualTo: uid)
        .orderBy('created')
        .limit(1)
        .get();
    return snapshot;
  }

  // add member to group
  addMember(String groupId) async {
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    await groupDocumentReference.update({
      'member': uid,
    });

    DocumentReference userDocumentReference = usersCollection.doc(uid);

    return await userDocumentReference.update({
      'groups': FieldValue.arrayUnion([groupDocumentReference.id]),
    });
  }

  Delete_group(String groupId) async {
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);
    QuerySnapshot snapshot =
        await groupCollection.where('groupId', isEqualTo: groupId).get();
    await groupDocumentReference.delete();

    DocumentReference adminDocumentReference =
        usersCollection.doc(snapshot?.docs[0]['admin']);
    DocumentReference memberDocumentReference =
        usersCollection.doc(snapshot?.docs[0]['member']);

    await adminDocumentReference.update({
      'groups': FieldValue.arrayRemove([groupDocumentReference.id]),
    });

    await memberDocumentReference.update({
      'groups': FieldValue.arrayRemove([groupDocumentReference.id]),
    });
  }

  // send message
  sendMessage(String groupId, Map<String, dynamic> chatMessageData) async {
    DocumentReference groupDocumentReference = groupCollection.doc(groupId);

    await groupDocumentReference.collection('messages').add(chatMessageData);

    return await groupDocumentReference.update({
      'recentMessage': chatMessageData['message'],
      'recentMessageSender': chatMessageData['sender'],
      'recentMessageTime': chatMessageData['time'],
    });
  }
}
