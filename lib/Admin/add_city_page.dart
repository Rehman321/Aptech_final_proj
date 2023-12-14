import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../misc/colors.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
 final _cityNameController = TextEditingController();
 final _cityDescController = TextEditingController();



 @override
 void dispose() {
   _cityNameController.dispose();
   _cityDescController.dispose();
   super.dispose();
 }

 Future signUp(BuildContext context) async{
   addCityDetails(
     _cityNameController.text.trim(),
     _cityDescController.text.trim(),
   );
   ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
       content: Text('City added successfully!'),
       duration: Duration(seconds: 2),
     ),
   );
 }

 Future addCityDetails(String cityName, String cityDesc) async{
   await FirebaseFirestore.instance.collection('cities').add({
     'city_name':cityName,
     'city_desc':cityDesc,
   });
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70,),
                //Welcome Text
                Text('Welcome !',
                  style:GoogleFonts.bebasNeue(
                    fontSize: 46,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20,),
                Text('Let\'s Add City',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50,),

                // cityname textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _cityNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'City Name',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                // city description textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _cityDescController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'City Description',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () => signUp(context),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Add City',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                        ),
                      ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
