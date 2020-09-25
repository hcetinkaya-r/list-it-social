import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:list_it_social/widgets/header.dart';
import 'package:list_it_social/widgets/progress.dart';

final usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  //List<dynamic> users = [];

  @override
  void initState() {
    //getUsers();
    //getUserById();
    //createUser();
    //updateUser();
    deleteUser();

    // TODO: implement initState
    super.initState();
  }

  createUser() async {
    usersRef
        .doc("asdfasdf")
        .set({"username": "Hulya", "postsCount": 0, "isAdmin": false});
  }

  updateUser() async{
    final doc = await usersRef.doc("5x2XUWFrSo6hxOM1JqLN").get();
    if(doc.exists){
      doc.reference.update({"username": "Nuriye", "postsCount": 0, "isAdmin": false});
    }
    

        //.update({"username": "Ramadan", "postsCount": 0, "isAdmin": false});
  }

  deleteUser() async {
   final DocumentSnapshot doc = await usersRef.doc("5x2XUWFrSo6hxOM1JqLN").get();
   if(doc.exists) {
     doc.reference.delete();
   }
  }

  /*getUsers() async {
    final QuerySnapshot snapshot = await usersRef.get();

    setState(() {
      users = snapshot.docs;

    });

    /*snapshot.docs.forEach((DocumentSnapshot doc) {
      print(doc.data());
      print(doc.id);
      print(doc.exists);
    });*/
  }*/

  /*getUserById() async {
    final String id = "jqQM5kpBCDuw5zSPYFlu";
    DocumentSnapshot doc = await usersRef.doc(id).get();
    print(doc.data());
    print(doc.id);
    print(doc.exists);
  }*/

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: usersRef.snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return circularProgress();
            }
            final List<Text> children = snapshot.data.docs
                .map((doc) => Text(doc.data()['username']))
                .toList();
            return Container(
              child: ListView(
                children: children,
              ),
            );
          },
        ),
      ),
    );
  }
}
