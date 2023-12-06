import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'misc/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List list =[
    "bikes",
    "cars",
    "cycle",
    "truck",
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder:(context,index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration:  Duration(milliseconds: 1000),
                      curve: Curves.bounceInOut,
                      width: 80,
                      height: 20,
                      margin: EdgeInsets.symmetric(horizontal:6),
                      decoration: BoxDecoration(
                        border:currentIndex==index?Border.all(color: Colors.black):Border.all(color: Colors.red),
                      ),
                      child: Center(
                        child: Text(list[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 50,),
          ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder:(context,index){
                return Center(
                  child: Text(list[currentIndex],style: TextStyle(color:Pallete.textColor),),
                );
              })
        ],

      ),
    );
  }
}
