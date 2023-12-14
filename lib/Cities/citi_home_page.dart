import 'package:final_proj/detail_page.dart';
import 'package:flutter/material.dart';

import '../Custom_page_routes.dart';
import '../misc/colors.dart';
class CitiHomePage extends StatefulWidget {
  const CitiHomePage({super.key});

  @override
  State<CitiHomePage> createState() => _CitiHomePageState();
}

class _CitiHomePageState extends State<CitiHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:CustomScrollView(
        slivers: [
          //sliver appbar
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            leading:IconButton(
                onPressed:(){
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back,color: Pallete.borderColor,)
            ),
            actions: [
              IconButton(
                  onPressed:(){
                  },
                  icon: Icon(Icons.logout_rounded,color: Pallete.borderColor,)
              ),
            ],
            title:Text('A D M I N'),
            expandedHeight: 300,
            floating: false,
            pinned:true,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.asset('images/Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg',
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
                    height: 300,
                    color: Colors.deepPurple,
                    child: Stack(
                      children: [
                        // Background image or placeholder
                        Image.asset(
                          'images/Leonardo_Diffusion_XL_Elevate_your_journey_Discover_the_tranqu_3.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        // Text in the left bottom corner
                        Positioned(
                          bottom: 16,
                          left: 16,
                          child: Text(
                            'Your Text',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // View more button on the bottom right corner
                        Positioned(
                          bottom: 16,
                          right: 16,
                          child: GestureDetector(
                            child: ElevatedButton(
                              onPressed: () {},

                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text('View More'),
                              ),
                            ),
                          ),
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
                          onPressed:(){},
                          child:Text('View Cities')
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 20,
                          ),
                          onPressed:(){},
                          child:Text('Add Cities')
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
                          onPressed:(){},
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
