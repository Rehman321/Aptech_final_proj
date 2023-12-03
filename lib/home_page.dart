// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//    HomePage({super.key});
//    final user = FirebaseAuth.instance.currentUser;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Home Page"),
//         actions: [
//           IconButton(
//               onPressed: ()async{
//                await FirebaseAuth.instance.signOut();
//               },
//               icon: const Icon(Icons.login_sharp),
//
//           )
//         ],
//       ),
//       body: Center(
//         child: Text(user!.email.toString()),
//       ),
//     );
//   }
// }
import 'package:final_proj/sea_page.dart';
import 'package:final_proj/widgets/App_Large_Text.dart';
import 'package:final_proj/widgets/App_Small_Text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Custom_page_routes.dart';
import 'detail_page.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu text
          Container(
            padding: const EdgeInsets.only(top: 20,left: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(""),
                ),
                Expanded(child: Container(
                  child: Text(widget.user!.email.toString(),selectionColor: Colors.black,),
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
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Plan Your Perfect Trip"),
          ),
          SizedBox(height: 10,),
          //tapbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left:20, right:0 ),
                controller: _tabController,
                labelColor: Colors.blueAccent,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: "Mountains",icon: Icon(Icons.access_alarm),),
                  Tab(text: "Sea",icon: Icon(Icons.access_alarm)),
                  Tab(text: "Surfing",icon: Icon(Icons.access_alarm)),
                  Tab(text: "Forest",icon: Icon(Icons.access_alarm)),
                  Tab(text: "Hunting",icon: Icon(Icons.access_alarm)),
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
                AppLargeText(text: "Cities",size: 20,),
                AppText(text: "Updated At",),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width:double.maxFinite,
            height: 150,
            margin: const EdgeInsets.only(left: 20, ),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          //margin: const EdgeInsets.only(right: 50,),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("images/"+images.keys.elementAt(index)),
                                fit: BoxFit.cover,)),
                        ),
                        SizedBox(height:5,),
                        Container(
                          child: AppText(text:images.values.elementAt(index)),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.only(left:10,),
            width: double.maxFinite,
            height: 400,
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
                        int tappedIndex = _tabController.index;
                        Navigator.push(
                          context,
                          CustomPageRoute(
                            builder: (context) => DetailPage(index: tappedIndex),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 20,top: 10,),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage("images/"+images.keys.elementAt(index)),
                              fit: BoxFit.cover,
                            )
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

          SizedBox(height: 30,),


        ],
      ),
    );
  }
}