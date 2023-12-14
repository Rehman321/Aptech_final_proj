import 'package:final_proj/misc/colors.dart';
import 'package:final_proj/profile_page.dart';
import 'package:final_proj/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  void pageShifter(index){
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> myScreen =[
    HomePage(),
    Search(),
    Profile(),


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myScreen[selectedIndex],
      bottomNavigationBar: Container(
        color:Pallete.textColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:9),
          child: GNav(
            gap: 10,
            backgroundColor:Pallete.textColor,
              color: Colors.white,
              activeColor: Colors.blueAccent,
            tabBackgroundColor: Colors.black,
              selectedIndex: selectedIndex,
              onTabChange:pageShifter,
              tabs: [
                GButton(icon: Icons.home,text: 'Home',),
                GButton(icon: Icons.search,text: 'Search',),
                GButton(icon: Icons.person,text: 'Profile',),
              ],
          ),
        ),
      ),
    );
  }
}
// bottomNavigationBar: CurvedNavigationBar(
// backgroundColor: Colors.transparent,
// color: Colors.blueAccent,
// index: selectedIndex,
// // showSelectedLabels: true,
// // showUnselectedLabels: true,
// // unselectedItemColor: Colors.grey,
// // selectedItemColor: Colors.blueAccent,
//
// // elevation: 0,
// onTap: pageShifter,
// items: [
// Icon(Icons.home_rounded, size: 30),
// Icon(Icons.explore_rounded, size: 30),
// Icon(Icons.person_rounded, size: 30),
// ],
// animationCurve: Curves.easeInOut,
// animationDuration: Duration(milliseconds: 300),
// height: 60,
// ),