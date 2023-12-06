import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_proj/profile_page.dart';
import 'package:final_proj/search_page.dart';

import 'package:flutter/material.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.blueAccent,
        index: selectedIndex,
        // showSelectedLabels: true,
        // showUnselectedLabels: true,
        // unselectedItemColor: Colors.grey,
        // selectedItemColor: Colors.blueAccent,

        // elevation: 0,
        onTap: pageShifter,
        items: [
          Icon(Icons.home_rounded, size: 30),
          Icon(Icons.explore_rounded, size: 30),
          Icon(Icons.person_rounded, size: 30),
        ],
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        height: 60,
      ),
    );
  }
}