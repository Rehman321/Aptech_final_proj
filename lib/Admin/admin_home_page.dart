import 'package:final_proj/Admin/add_attraction_page.dart';
import 'package:final_proj/Admin/add_city_page.dart';
import 'package:final_proj/Admin/add_user_page.dart';
import 'package:final_proj/Admin/city_fetch_page.dart';
import 'package:final_proj/Admin/user_fetch_page.dart';
import 'package:final_proj/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Custom_page_routes.dart';
class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});
@override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body:CustomScrollView(
       slivers: [
         //sliver appbar
         SliverAppBar(
           backgroundColor: Colors.deepPurple,
           leading:Icon(Icons.menu_outlined,color: Pallete.borderColor,),
           actions: [
             IconButton(
               onPressed: ()async{
                 await FirebaseAuth.instance.signOut();
               },
               icon: const Icon(Icons.logout,color: Colors.black,),
             ),
           ],
           title:Text('A D M I N'),
           expandedHeight: 300,
           floating: false,
           pinned:true,
           flexibleSpace: FlexibleSpaceBar(
             background:Image.asset('images/Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_2.jpg',
               fit:BoxFit.cover,
             ),

           ),
         ),

         //sliver items
         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Users',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color:Pallete.whiteColor,
                       ),
                     ),
                     SizedBox(height: 16),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         elevation: 20,
                       ),
                       onPressed: () {
                         // Add users functionalit
                         // Navigator.push(...); // Navigate to the add users screen
                         Navigator.push(
                           context,
                           CustomPageRoute(
                             builder: (context) => InsertScreen(),
                           ),
                         );
                       },
                       child: Text('Add Users'),
                     ),
                     SizedBox(height: 8),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         elevation: 20,
                       ),
                       onPressed: () {
                         // View all users functionality
                         // Navigator.push(...); // Navigate to the view all users screen
                         Navigator.push(
                           context,
                           CustomPageRoute(
                             builder: (context) => UserFetchPage(),
                           ),
                         );
                       },
                       child: Text('View All Users'),
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),

         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Cities',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color:Pallete.whiteColor,
                       ),
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           elevation: 20,
                         ),
                         onPressed:(){
                           Navigator.push(
                             context,
                             CustomPageRoute(
                               builder: (context) => AddCity(),
                             ),
                           );
                         },
                         child:Text('Add Cities')
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           elevation: 20,
                         ),
                         onPressed:(){
                           Navigator.push(
                             context,
                             CustomPageRoute(
                               builder: (context) => CityFetchPage(),
                             ),
                           );
                         },
                         child:Text('View Cities')
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),

         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('Attractions',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color:Pallete.whiteColor,
                       ),
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         elevation: 20,
                       ),
                         onPressed:(){},
                         child:Text('View Attractions')
                     ),
                     SizedBox(height: 10,),
                     ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           elevation: 20,
                         ),
                         onPressed:(){
                           Navigator.push(
                             context,
                             CustomPageRoute(
                               builder: (context) => AddAttraction(),
                             ),
                           );
                         },
                         child:Text('Add Attractions')
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),




         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
               ),
             ),
           ),
         ),
         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
               ),
             ),
           ),
         ),
         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
               ),
             ),
           ),
         ),
         SliverToBoxAdapter(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child: ClipRRect(
               borderRadius: BorderRadius.circular(20),
               child: Container(
                 height: 200,
                 color: Colors.deepPurple,
               ),
             ),
           ),
         ),
       ],
      ),
    );
  }
}
