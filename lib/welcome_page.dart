import 'package:final_proj/widgets/App_Large_Text.dart';
import 'package:final_proj/widgets/App_Small_Text.dart';
import 'package:final_proj/widgets/responsive_button.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images =[
    "Leonardo_Diffusion_XL_Hit_the_road_with_us_Experience_the_free_3.jpg",
    "welcome-img2.jpg",
    "welcome-img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: images.length,
          scrollDirection: Axis.vertical,
          itemBuilder:(context,index){
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:AssetImage(
                        "img/" + images[index],
                      ),
                      fit: BoxFit.cover
                  )
              ),
              child: Container(
                margin: const EdgeInsets.only(top:150,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Trip"),
                        AppText(text: "Let's Discover"),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                          },
                          child: Container(
                              child: ResponsvieButton(width: 120,)),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                        return Container(
                          margin: const EdgeInsets.only(left:120,),
                          height: index==indexDots?25:8,
                          width:8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:index==indexDots?Colors.grey:Colors.white
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}