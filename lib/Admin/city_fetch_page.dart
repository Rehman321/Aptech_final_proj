import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../misc/colors.dart';
import 'get_city_page.dart';

class CityFetchPage extends StatefulWidget {
   CityFetchPage({super.key});
  final user = FirebaseAuth.instance.currentUser;
  @override
  State<CityFetchPage> createState() => _CityFetchPageState();
}

class _CityFetchPageState extends State<CityFetchPage> {

  List<String> docIds=[];

  Future getDocIds() async{
    await FirebaseFirestore.instance.collection('cities').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIds.add(document.reference.id);
          }),);
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
                  future: getDocIds(),
                  builder: (context,snapshot){
                    return  ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title:GetCityName(documentId: docIds[index],),
                            tileColor: Colors.grey,
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
