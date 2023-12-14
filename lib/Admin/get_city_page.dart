import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetCityName extends StatelessWidget {

  final String documentId;

  GetCityName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference cities = FirebaseFirestore.instance.collection('cities');

    return FutureBuilder<DocumentSnapshot>(
      future: cities.doc(documentId).get(),
      builder:((context,snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        Map<String, dynamic> data =
        snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['city_name']}');
      }
      return Text('Loading...');
    }),
    );
  }
}
