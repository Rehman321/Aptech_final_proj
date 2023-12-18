import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_proj/detail_page.dart';
import 'package:flutter/material.dart';

import '../Custom_page_routes.dart';
import '../misc/colors.dart';
import '../widgets/attraction_widget.dart';
// class CitiHomePage extends StatefulWidget {
//   const CitiHomePage({super.key});
//
//   @override
//   State<CitiHomePage> createState() => _CitiHomePageState();
// }
//
// class _CitiHomePageState extends State<CitiHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body:CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.deepPurple,
//             leading:IconButton(
//                 onPressed:(){
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(Icons.arrow_back,color: Pallete.borderColor,)
//             ),
//             actions: [
//               IconButton(
//                   onPressed:(){
//                   },
//                   icon: Icon(Icons.logout_rounded,color: Pallete.borderColor,)
//               ),
//             ],
//             title:Text('A D M I N'),
//             expandedHeight: 300,
//             floating: false,
//             pinned:true,
//             flexibleSpace: FlexibleSpaceBar(
//               background:Image.asset('images/Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg',
//                 fit:BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     height: 300,
//                     color: Colors.deepPurple,
//                     child: Stack(
//                       children: [
//                         Image.asset(
//                           'images/Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg',
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: double.infinity,
//                         ),
//                         Positioned(
//                           bottom: 16,
//                           left: 16,
//                           child: Text(
//                             'Your Text',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 16,
//                           right: 16,
//                           child: GestureDetector(
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: Text('View More'),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Cities',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color:Pallete.whiteColor,
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 20,
//                           ),
//                           onPressed:(){},
//                           child:Text('View Cities')
//                       ),
//                       SizedBox(height: 10,),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 20,
//                           ),
//                           onPressed:(){},
//                           child:Text('Add Cities')
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Attractions',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color:Pallete.whiteColor,
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 20,
//                           ),
//                           onPressed:(){},
//                           child:Text('View Attractions')
//                       ),
//                       SizedBox(height: 10,),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             elevation: 20,
//                           ),
//                           onPressed:(){},
//                           child:Text('Add Attractions')
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 200,
//                   color: Colors.deepPurple,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class CitiHomePage extends StatelessWidget {
//   final QueryDocumentSnapshot cityData;
//
//   CitiHomePage({required this.cityData});
//
//   @override
//   Widget build(BuildContext context) {
//     final String cityName = cityData['city_name'] ?? 'Unknown City';
//     final String imageUrl = cityData['City-Image'] ?? '';
//     final String description = cityData['city_desc'] ?? '';
//
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             backgroundColor: Colors.deepPurple,
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               icon: Icon(Icons.arrow_back, color: Pallete.borderColor),
//             ),
//             actions: [
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(Icons.logout_rounded, color: Pallete.borderColor),
//               ),
//             ],
//             title: Text(cityName),
//             expandedHeight: 300,
//             floating: false,
//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 250,
//                   color: Colors.transparent,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Description',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Pallete.textColor,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         description,
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: Pallete.textColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//
//             ),
//
//
//
//
//           ),
//
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Container(
//                   height: 250,
//                   color: Colors.transparent,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Attractions',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Pallete.textColor,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       // Use FutureBuilder or StreamBuilder here to fetch and display attractions
//                       FutureBuilder<QuerySnapshot>(
//                         future: FirebaseFirestore.instance
//                             .collection('attractions')
//                             .where('City-ID', isEqualTo: cityData.id)
//                             .get(),
//                         builder: (context, snapshot) {
//                           if (snapshot.connectionState == ConnectionState.waiting) {
//                             return CircularProgressIndicator();
//                           } else if (snapshot.hasError) {
//                             return Text('Error: ${snapshot.error}');
//                           } else if (!snapshot.hasData || snapshot.data == null) {
//                             return Text('Attractions not found');
//                           } else {
//                             // Extract and display attraction data
//                             var attractions = snapshot.data!.docs;
//                             return Column(
//                               children: attractions.map((attraction) {
//                                 var attName = attraction['att_name'];
//                                 var attDescription = attraction['att_desc'];
//
//                                 // TODO: Display attraction data in your UI
//                                 return YourAttractionWidget(
//                                   attName: attName,
//                                   attDescription: attDescription,
//                                 );
//                               }).toList(),
//                             );
//                           }
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//
//         ],
//       ),
//     );
//   }
// }

class CitiHomePage extends StatelessWidget {
  final QueryDocumentSnapshot cityData;

  CitiHomePage({required this.cityData});

  @override
  Widget build(BuildContext context) {
    final String cityName = cityData['city_name'] ?? 'Unknown City';
    final String imageUrl = cityData['City-Image'] ?? '';
    final String description = cityData['city_desc'] ?? '';

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back, color: Pallete.borderColor),
            ),
            title: Text(cityName),
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 250,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Pallete.textColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 13,
                          color: Pallete.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         height: 350,
          //         color: Colors.transparent,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'Attractions',
          //               style: TextStyle(
          //                 fontSize: 25,
          //                 fontWeight: FontWeight.bold,
          //                 color: Pallete.textColor,
          //               ),
          //             ),
          //             SizedBox(height: 10),
          //             // Use FutureBuilder or StreamBuilder here to fetch and display attractions
          //             FutureBuilder<QuerySnapshot>(
          //               future: FirebaseFirestore.instance
          //                   .collection('attractions')
          //                   .where('City-ID', isEqualTo: cityData.id)
          //                   .get(),
          //               builder: (context, snapshot) {
          //                 if (snapshot.connectionState == ConnectionState.waiting) {
          //                   return CircularProgressIndicator();
          //                 } else if (snapshot.hasError) {
          //                   return Text('Error: ${snapshot.error}');
          //                 } else if (!snapshot.hasData || snapshot.data == null) {
          //                   return Text('Attractions not found');
          //                 } else {
          //                   // Extract and display attraction data
          //                   var attractions = snapshot.data!.docs;
          //                   return Column(
          //                     children: attractions.map((attraction) {
          //                       var attName = attraction['att_name'];
          //                       var attDescription = attraction['att_desc'];
          //
          //                       // TODO: Display attraction data in your UI
          //                       return GestureDetector(
          //                         onTap: () {
          //                           // Navigate to detail_page with attraction details
          //                           Navigator.push(
          //                             context,
          //                             CustomPageRoute(
          //                               builder: (context) => DetailPage(
          //                                 attName: attName,
          //                                 attDescription: attDescription,
          //                                 attImageUrl: attraction['att-Image'],
          //                               ),
          //                             ),
          //                           );
          //                         },
          //                         child: AttractionWidget(
          //                           attName: attName,
          //                           attDescription: attDescription,
          //                           attImageUrl: attraction['att-Image'],
          //                         ),
          //                       );
          //                     }).toList(),
          //                   );
          //                 }
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Text(
                        'Attractions',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Pallete.textColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Use FutureBuilder or StreamBuilder here to fetch and display attractions
                      FutureBuilder<QuerySnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('attractions')
                            .where('City-ID', isEqualTo: cityData.id)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData || snapshot.data == null) {
                            return Text('Attractions not found');
                          } else {
                            // Extract and display attraction data
                            var attractions = snapshot.data!.docs;
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: attractions.length,
                              itemBuilder: (context, index) {
                                var attName = attractions[index]['att_name'];
                                var attDescription = attractions[index]['att_desc'];

                                return GestureDetector(
                                  onTap: () {
                                    // Navigate to detail_page with attraction details
                                    Navigator.push(
                                      context,
                                      CustomPageRoute(
                                        builder: (context) => DetailPage(
                                          attName: attName,
                                          attDescription: attDescription,
                                          attImageUrl: attractions[index]['att-Image'],
                                        ),
                                      ),
                                    );
                                  },
                                  child: AttractionWidget(
                                    attName: attName,
                                    attDescription: attDescription,
                                    attImageUrl: attractions[index]['att-Image'],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),







          // SliverToBoxAdapter(
          //   child: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: Container(
          //         height: 350,
          //         color: Colors.transparent,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text(
          //               'Attractions',
          //               style: TextStyle(
          //                 fontSize: 25,
          //                 fontWeight: FontWeight.bold,
          //                 color: Pallete.textColor,
          //               ),
          //             ),
          //             SizedBox(height: 10),
          //             // Use FutureBuilder or StreamBuilder here to fetch and display attractions
          //             FutureBuilder<QuerySnapshot>(
          //               future: FirebaseFirestore.instance
          //                   .collection('attractions')
          //                   .where('City-ID', isEqualTo: cityData.id)
          //                   .get(),
          //               builder: (context, snapshot) {
          //                 if (snapshot.connectionState == ConnectionState.waiting) {
          //                   return CircularProgressIndicator();
          //                 } else if (snapshot.hasError) {
          //                   return Text('Error: ${snapshot.error}');
          //                 } else if (!snapshot.hasData || snapshot.data == null) {
          //                   return Text('Attractions not found');
          //                 } else {
          //                   // Extract and display attraction data
          //                   var attractions = snapshot.data!.docs;
          //                   return Column(
          //                     children: attractions.map((attraction) {
          //                       var attName = attraction['att_name'];
          //                       var attDescription = attraction['att_desc'];
          //
          //                       // TODO: Display attraction data in your UI
          //                       return AttractionWidget(
          //                         attName: attName,
          //                         attDescription: attDescription,
          //                         attImageUrl: attraction['att-Image'],
          //                       );
          //                     }).toList(),
          //                   );
          //                 }
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
