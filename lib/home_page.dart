// import 'package:final_proj/widgets/App_Large_Text.dart';
// import 'package:final_proj/widgets/App_Small_Text.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'Admin/get_city_page.dart';
// import 'Cities/citi_home_page.dart';
// import 'Custom_page_routes.dart';
// import 'detail_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// class HomePage extends StatefulWidget {
//   HomePage({super.key});
//   final user = FirebaseAuth.instance.currentUser;
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
//   var images = {
//     "Leonardo_Diffusion_XL_Timetravel_through_history_Explore_the_e_1.jpg":"Karachi",
//     "Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_2.jpg":"Lahore",
//     "Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg":"Peshawar",
//     "Leonardo_Diffusion_XL_Hit_the_road_with_us_Experience_the_free_2.jpg":"Quetta",
//   };
//
//
//   List<String> docIds=[];
//
//   Future getDocIds() async{
//     await FirebaseFirestore.instance.collection('cities').get().then(
//           (snapshot) => snapshot.docs.forEach((document) {
//         print(document.reference);
//         docIds.add(document.reference.id);
//       }),);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     TabController _tabController = TabController(length: 5, vsync: this);
//     return Scaffold(
//       body: SingleChildScrollView(
//         physics: const ScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             //menu text
//             Container(
//               padding: const EdgeInsets.only(top: 20,left: 20),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundImage: NetworkImage(""),
//                   ),
//
//                   Expanded(
//                     child: Container(
//                       margin:EdgeInsets.only(left:10),
//                       child: Text(widget.user!.email.toString(),
//                         style:TextStyle(
//                             color: Colors.black,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: ()async{
//                       await FirebaseAuth.instance.signOut();
//                     },
//                     icon: const Icon(Icons.logout,color: Colors.black,),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20,),
//             //Plan a trip
//
//             SizedBox(height: 10,),
//             //tapbar
//             Container(
//               margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               width: 300,
//               height: 30,
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: TabBar(
//                   labelPadding: const EdgeInsets.only(left:20, right:0 ),
//                   controller: _tabController,
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                   isScrollable: true,
//                   indicatorSize: TabBarIndicatorSize.label,
//                   tabs: [
//                     Tab(text: "Hunting",),
//                     Tab(text: "Hunting",),
//                     Tab(text: "Hunting",),
//                     Tab(text: "Hunting",),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//
//             Container(
//               margin: const EdgeInsets.only(left: 20,right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AppLargeText(text: "Cities",size: 30,),
//                   AppText(text: "Updated At",),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               width:double.maxFinite,
//               height: 200,
//               margin: const EdgeInsets.only(left: 20, ),
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: docIds.length,
//                   itemBuilder: (context,index){
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           CustomPageRoute(
//                             builder: (context) => CitiHomePage(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.only(right: 30),
//                         child: Column(
//                           children: [
//                             FutureBuilder(
//                                 future: getDocIds(),
//                                 builder: (context,snapshot){
//                                   return  ListView.builder(
//                                     itemCount: docIds.length,
//                                     itemBuilder: (context,index){
//                                       return Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: ListTile(
//                                           textColor: Colors.black,
//                                           title:GetCityName(documentId: docIds[index],),
//                                           tileColor: Colors.black,
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 }),
//                             Container(
//                               //margin: const EdgeInsets.only(right: 50,),
//                               width: 150,
//                               height: 150,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   image: DecorationImage(
//                                     image: AssetImage("images/"+images.keys.elementAt(index)),
//                                     fit: BoxFit.cover,)),
//                             ),
//                             SizedBox(height:5,),
//                             Container(
//                               child: AppText(text:images.values.elementAt(index),color: Colors.black,size: 20,),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               margin: const EdgeInsets.only(left: 20,right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AppLargeText(text: "Popular At This Time ",size: 25,),
//                 ],
//               ),
//             ),
//             SizedBox(height: 10,),
//             Container(
//               padding: const EdgeInsets.only(left:10,),
//               width: double.maxFinite,
//               height: 350,
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount:4,
//                     itemBuilder: (BuildContext context, int index)
//                     {
//                       return GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             CustomPageRoute(
//                               builder: (context) => DetailPage(index: index),
//                             ),
//                           );
//                         },
//
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 20,top: 10,),
//                           width: 200,
//                           height: 350,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               image: DecorationImage(
//                                 image: AssetImage("images/"+images.keys.elementAt(index)),
//                                 fit: BoxFit.cover,
//                               )
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:50),
//                                 child: Text(
//                                   images.values.elementAt(index),
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                   Tab(text: "Sea page",),
//                   Tab(text: "Surfing page",),
//                   Tab(text: "Forest page",),
//                   Tab(text: "Hunting page",),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:final_proj/widgets/App_Large_Text.dart';
import 'package:final_proj/widgets/App_Small_Text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Cities/citi_home_page.dart';
import 'Custom_page_routes.dart';
import 'detail_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "Leonardo_Diffusion_XL_Timetravel_through_history_Explore_the_e_1.jpg":"Karachi",
    "Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_2.jpg":"Lahore",
    "Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg":"Peshawar",
    "Leonardo_Diffusion_XL_Hit_the_road_with_us_Experience_the_free_2.jpg":"Quetta",
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //menu text
            Container(
              padding: const EdgeInsets.only(top: 20,left: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(""),
                  ),

                  Expanded(
                    child: Container(
                      margin:EdgeInsets.only(left:10),
                      child: Text(widget.user!.email.toString(),
                        style:TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: ()async{
                      await FirebaseAuth.instance.signOut();
                    },
                    icon: const Icon(Icons.logout,color: Colors.black,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            //Plan a trip

            SizedBox(height: 10,),
            //tapbar
            Container(
              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              width: 300,
              height: 30,
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left:20, right:0 ),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(text: "Hunting",),
                    Tab(text: "Hunting",),
                    Tab(text: "Hunting",),
                    Tab(text: "Hunting",),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),

            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Cities",size: 25,),

                ],
              ),
            ),
            SizedBox(height: 10,),

            Container(
              width: double.maxFinite,
              height: 200,
              margin: const EdgeInsets.only(left: 20),
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance.collection('cities').get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  final citiesData = snapshot.data?.docs;

                  if (citiesData == null || citiesData.isEmpty) {
                    return Text('No data available');
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: citiesData.length,
                    itemBuilder: (context, index) {
                      final cityData = citiesData[index].data() as Map<String, dynamic>;
                      final cityName = cityData['city_name'] ?? 'Unknown City';
                      final imageUrl = cityData['City-Image'] ?? '';


                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              builder: (context) => CitiHomePage(
                                cityData: citiesData[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: AppText(
                                  text: cityName,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),



            SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Popular At This Time ",size: 22,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(left:10,),
              width: double.maxFinite,
              height: 350,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:4,
                    itemBuilder: (BuildContext context, int index)
                    {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              builder: (context) => DetailPage(attName: '', attDescription: '', attImageUrl: '',),
                            ),
                          );
                        },

                        child: Container(
                          margin: const EdgeInsets.only(right: 20,top: 10,),
                          width: 200,
                          height: 350,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("images/"+images.keys.elementAt(index)),
                                fit: BoxFit.cover,
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:50),
                                child: Text(
                                  images.values.elementAt(index),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Tab(text: "Sea page",),
                  Tab(text: "Surfing page",),
                  Tab(text: "Forest page",),
                  Tab(text: "Hunting page",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}