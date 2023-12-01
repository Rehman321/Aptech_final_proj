import 'package:final_proj/profile_page.dart';
import 'package:final_proj/search_page.dart';
import 'package:flutter/cupertino.dart';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        elevation: 0,
        onTap: pageShifter,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.apps_rounded),label:"home"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label:"Profile"),
        ],
      ),
    );
  }
}