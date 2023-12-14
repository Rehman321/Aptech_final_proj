import 'package:final_proj/widgets/App_Large_Text.dart';
import 'package:final_proj/widgets/App_Small_Text.dart';
import 'package:final_proj/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int index;
  DetailPage({required this.index, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenstars=4;
  @override
  Widget build(BuildContext context) {
     return Scaffold(
  body: Container(
    width: double.maxFinite,
    height: double.maxFinite,
    child: Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image:DecorationImage(
                  image: AssetImage("images/welcome1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        Positioned(
            top: 400,
            child: Container(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_sharp),
                      AppLargeText(text: "Bordeaux, France",color: Colors.black,),
                      AppLargeText(text: "\$250",color: Colors.black,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(

                    children: [
                      SizedBox(width: 15,),
                      AppText(text: "About Trip",size: 20,),
                      SizedBox(width: 15,),
                      Wrap(
                        children: List.generate(5, (index){
                          return Icon(Icons.star,color:index<gottenstars?Colors.yellow:Colors.grey);
                        }),
                      ),
                      SizedBox(width: 10,),
                      AppText(text: "(232)"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  AppText(text:"Join Us on a unforgettable journey through the stunning Amalifi Coast, Where we'll explore some of the reigon's most beautiful and lesser-known destination",size: 15,color:Colors.grey,),
                ],
              ),

            )),
        Positioned(
            left: 10,
            top: 20,
            child:Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon:Icon(Icons.arrow_back),
                  color: Colors.grey,
                )
              ],
            )),
        Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Row(
              children: [
                ResponsvieButton(
                  isResponsive: true,
                )
              ],
            ))
      ],

    ),
  ),
);
  }
}
