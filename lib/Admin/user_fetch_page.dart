import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_proj/Admin/get_user_page.dart';
import 'package:final_proj/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserFetchPage extends StatefulWidget {
  UserFetchPage({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  State<UserFetchPage> createState() => _UserFetchPageState();
}

class _UserFetchPageState extends State<UserFetchPage> {
  //documents Ids
  List<String> docIds = [];

  // get doc Ids
  Future getDocId() async{
    await FirebaseFirestore.instance.collection('users').get().then(
            (snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.user!.email.toString(),style: TextStyle(color: Pallete.whiteColor),),
        actions: [
          GestureDetector(
            onTap: (){
              FirebaseAuth.instance.signOut();
            },
              child:Icon(Icons.logout_rounded)
          ),
        ],
      ),
      body:Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded(
            child:FutureBuilder(
              future: getDocId(),
                builder: (context,snapshot){
              return  ListView.builder(
                itemCount: docIds.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title:GetUserName(documentID: docIds[index],),
                          tileColor: Colors.black,
                    ),
                  );
                },
              );
            }),
        ),

      ],
    ),
      ),
    );
  }
}

