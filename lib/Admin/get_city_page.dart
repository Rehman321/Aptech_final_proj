import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class GetCityName extends StatelessWidget {
//
//   final String? documentId;
//
//   GetCityData({required this.documentId});
//
//   @override
//   Widget build(BuildContext context) {
//     CollectionReference cities = FirebaseFirestore.instance.collection('cities');
//
//     return FutureBuilder<DocumentSnapshot>(
//       future: cities.doc(documentId).get(),
//       builder:((context,snapshot){
//       if(snapshot.connectionState == ConnectionState.done){
//         Map<String, dynamic> data =
//         snapshot.data!.data() as Map<String, dynamic>;
//         return Column(
//           children: [
//             Text('${data['city_name']}'),
//             Image.network(data['City-Image'], height: 100, width: 100),
//           ],
//         );
//       }
//       return Text('Loading...');
//     }),
//     );
//   }
// }
class GetCityName extends StatelessWidget {
  final String documentId;

  GetCityName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference cities = FirebaseFirestore.instance.collection('cities');

    return FutureBuilder<DocumentSnapshot>(
      future: cities.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
            String cityName = data['city_name'];
            String? imageUrl = data['City-Image'];
            return ListTile(
              tileColor: Colors.grey,
              leading: imageUrl != null
                  ? CircleAvatar(
                radius: 30, // Set the desired radius
                backgroundImage: NetworkImage(imageUrl),
              )
                  : CircleAvatar(), // Default avatar if imageUrl is null
              title: Text(cityName),
            );
          } else {
            return Text('Document does not exist');
          }
        }
        return Text('Loading...');
      },
    );
  }
}
