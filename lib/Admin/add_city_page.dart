// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../misc/colors.dart';
//
// class AddCity extends StatefulWidget {
//   const AddCity({super.key});
//
//   @override
//   State<AddCity> createState() => _AddCityState();
// }
//
// class _AddCityState extends State<AddCity> {
//  final _cityNameController = TextEditingController();
//  final _cityDescController = TextEditingController();
//
//
//
//  @override
//  void dispose() {
//    _cityNameController.dispose();
//    _cityDescController.dispose();
//    super.dispose();
//  }
//
//  Future signUp(BuildContext context) async{
//    addCityDetails(
//      _cityNameController.text.trim(),
//      _cityDescController.text.trim(),
//    );
//    ScaffoldMessenger.of(context).showSnackBar(
//      SnackBar(
//        content: Text('City added successfully!'),
//        duration: Duration(seconds: 2),
//      ),
//    );
//  }
//
//  Future addCityDetails(String cityName, String cityDesc) async{
//    await FirebaseFirestore.instance.collection('cities').add({
//      'city_name':cityName,
//      'city_desc':cityDesc,
//    });
//  }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 70,),
//                 //Welcome Text
//                 Text('Welcome !',
//                   style:GoogleFonts.bebasNeue(
//                     fontSize: 46,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 Text('Let\'s Add City',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 50,),
//
//                 // cityname textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _cityNameController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'City Name',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20,),
//
//                 // city description textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _cityDescController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'City Description',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: GestureDetector(
//                     onTap: () => signUp(context),
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(child: Text('Add City',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17
//                         ),
//                       ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_proj/Admin/admin_home_page.dart';
import 'package:final_proj/home_page.dart';
import 'package:final_proj/main.dart';
import 'package:final_proj/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../Custom_page_routes.dart';

class AddCity extends StatefulWidget {
  const AddCity({super.key});

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {

  TextEditingController cityname = TextEditingController();
  TextEditingController citydescription = TextEditingController();

  File? userProfile;
  bool screenLoader = false;

  void userInertwithImage()async{
    setState(() {
      screenLoader = !screenLoader;
    });
    String cityID = Uuid().v1();
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("City-Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String userImage = await taskSnapshot.ref.getDownloadURL();
    userInsert(imgUrl: userImage,uID: cityID);
    SharedPreferences userLog = await SharedPreferences.getInstance();
    userLog.setString('cityID', cityID);
    setState(() {
      screenLoader = !screenLoader;
    });
    Navigator.pop(context);
  }

  void userInsert({String? imgUrl, String? uID})async{
    Map<String, dynamic> useradd = {
      "City-ID": uID,
      "city_name": cityname.text.toString(),
      "city_desc": citydescription.text.toString(),
      "City-Image": imgUrl,
    };
    // SharedPreferences userCheck = await SharedPreferences.getInstance();
    // if (Email.text.toString()=="admin1@gmail.com") {
    //   userCheck.setString('userCheck', "admin");
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
    // }
    // else{
    //   userCheck.setString('userCheck', "users");
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    // }
    FirebaseFirestore.instance.collection("cities").doc(uID).set(useradd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: (){
                FirebaseAuth.instance.signOut();
              },
              child:Icon(Icons.logout_rounded)
          ),
        ],
      ),
      backgroundColor: Pallete.textColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("Insert Data"),
                SizedBox(
                  height: 10,
                ),

                GestureDetector(
                  onTap: ()async{
                    XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                    if (selectedImage!=null) {
                      File convertedFile  = File(selectedImage.path);
                      setState(() {
                        userProfile = convertedFile;
                      });
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No Image Selected")));
                    }
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    backgroundImage: userProfile!=null?FileImage(userProfile!):null,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: cityname,
                  decoration: InputDecoration(
                      labelText: "Enter City Name",
                      suffixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: citydescription,
                  decoration: InputDecoration(
                      labelText: "Enter Your City Description", suffixIcon: Icon(Icons.key)),
                ),
                SizedBox(
                  height: 10,
                ),
                screenLoader==false?ElevatedButton(
                    onPressed: () {
                      userInertwithImage();
                    },
                    child: Text("Insert")):SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(child: CircularProgressIndicator(),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}