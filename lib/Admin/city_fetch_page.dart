

// class CityFetchPage extends StatefulWidget {
//    CityFetchPage({super.key});
//   final user = FirebaseAuth.instance.currentUser;
//   @override
//   State<CityFetchPage> createState() => _CityFetchPageState();
// }
//
// class _CityFetchPageState extends State<CityFetchPage> {
//
//   List<String> docIds=[];
//
//   Future getDocIds() async{
//     await FirebaseFirestore.instance.collection('cities').get().then(
//           (snapshot) => snapshot.docs.forEach((document) {
//             print(document.reference);
//             docIds.add(document.reference.id);
//           }),);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:Text(widget.user!.email.toString(),style: TextStyle(color: Pallete.whiteColor),),
//         actions: [
//           GestureDetector(
//               onTap: (){
//                 FirebaseAuth.instance.signOut();
//               },
//               child:Icon(Icons.logout_rounded)
//           ),
//         ],
//       ),
//       body:Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child:FutureBuilder(
//                   future: getDocIds(),
//                   builder: (context,snapshot){
//                     return  ListView.builder(
//                       itemCount: docIds.length,
//                       itemBuilder: (context,index){
//                         return Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title:GetCityName(documentId: docIds[index],),
//                             tileColor: Colors.grey,
//                           ),
//                         );
//                       },
//                     );
//                   }),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../misc/colors.dart';
import 'get_city_page.dart';

class CityFetchPage extends StatefulWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  State<CityFetchPage> createState() => _CityFetchPageState();
}

class _CityFetchPageState extends State<CityFetchPage> {
  late Future<List<String>> docIds;

  Future<List<String>> getDocIds() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('cities').get();
      return snapshot.docs.map((document) => document.id).toList();
    } catch (e) {
      print("Error fetching document IDs: $e");
      return [];
    }
  }
  @override
  void initState() {
    super.initState();
    docIds = getDocIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user!.email.toString(), style: TextStyle(color: Pallete.whiteColor)),
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            child: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: getDocIds(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final data = snapshot.data;

                  if (data == null || data.isEmpty) {
                    return Text('No data available');
                  }
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final documentId = data[index];
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: ListTile(
                      //       title: documentId != null
                      //           ? GetCityName(documentId: documentId)
                      //           : Text('Document ID is null'),
                      //       tileColor: Colors.grey
                      //   ),
                      // );
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: documentId != null
                              ? GetCityName(documentId: documentId)
                              : Text('Document ID is null'),
                          tileColor: Colors.grey,
                          onTap: () async {
                            if (documentId != null) {
                              // Add a confirmation dialog to confirm the delete action
                              bool deleteConfirmed = await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirm Delete'),
                                    content: Text('Are you sure you want to delete this city?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(false);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(true);
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              // If the user confirms the delete action, proceed with deletion
                              if (deleteConfirmed == true) {
                                await FirebaseFirestore.instance.collection('cities').doc(documentId).delete();
                                // You may also want to update the UI after deletion
                                setState(() {
                                  // Update your data or trigger a new fetch
                                });
                              }
                            }
                          },
                        ),
                      );

                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
