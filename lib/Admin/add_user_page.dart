// import 'dart:html';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';
// import '../misc/colors.dart';
//
// class AddUserPage extends StatefulWidget {
//
//   const AddUserPage({super.key});
//
//   @override
//   State<AddUserPage> createState() => _AddUserPageState();
// }
// class _AddUserPageState extends State<AddUserPage> {
//   //text controllers
//   final _emailController = TextEditingController();
//   final _passwrodController = TextEditingController();
//   final _confirmpassController = TextEditingController();
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _ageController = TextEditingController();
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwrodController.dispose();
//     _confirmpassController.dispose();
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _ageController.dispose();
//     super.dispose();
//   }
//
//   Future signUp() async{
//     if(passConfirmed()){
//       //user created
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwrodController.text.trim(),
//       );
//       //add user details
//       addUserDatails(
//         _firstNameController.text.trim(),
//         _lastNameController.text.trim(),
//         _emailController.text.trim(),
//         int.parse(_ageController.text.trim()),
//       );
//     }
//   }
//
//   Future addUserDatails(String firstName, String lastName, String email, int age) async{
//     await FirebaseFirestore.instance.collection('users').add({
//       'first name': firstName,
//       'last name': lastName,
//       'email': email,
//       'age': age,
//     });
//   }
//
//   bool passConfirmed(){
//     if(_passwrodController.text.trim() == _confirmpassController.text.trim()){
//       return true;
//     }else{
//       return false;
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           // IconButton(onPressed: (){},
//           //     icon: Icon(Icons.arrow_left)
//           // ),
//         ],
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
//                 Text('Let\'s Register',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 50,),
//
//                 // firstname textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _firstNameController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'First Name',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20,),
//
//                 // lastname textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _lastNameController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Last Name',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//
//                 // age textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _ageController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Age',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//
//                 // email textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Email',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 20,),
//
//
//
//                 //password textfield
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _passwrodController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Password',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 //confirm password
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _confirmpassController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color:Pallete.gradient2,width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Password',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20,),
//                 //sign in button
//
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: GestureDetector(
//                     onTap: signUp,
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(child: Text('Sign Up',
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
//                 //sign up
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Already Have Account?',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),),
//                     // GestureDetector(
//                     //   onTap:widget.showLoginPage,
//                     //   child: Text(' Login Now',
//                     //     style: TextStyle(
//                     //       color: Colors.blueAccent,
//                     //       fontWeight: FontWeight.bold,
//                     //     ),
//                     //   ),
//                     // ),
//                   ],
//                 )
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
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({super.key});

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  File? userProfile;
  bool screenLoader = false;

  void userInertwithImage()async{
    setState(() {
      screenLoader = !screenLoader;
    });
    String userID = Uuid().v1();
    UploadTask uploadTask = FirebaseStorage.instance.ref().child("User-Images").child(Uuid().v1()).putFile(userProfile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String userImage = await taskSnapshot.ref.getDownloadURL();
    SharedPreferences userLog = await SharedPreferences.getInstance();
    userLog.setString('userID', userID);
    userInsert(imgUrl: userImage,uID: userID);
    setState(() {
      screenLoader = !screenLoader;
    });
    Navigator.pop(context);
  }

  void userInsert({String? imgUrl, String? uID})async{
    Map<String, dynamic> useradd = {
      "User-ID": uID,
      "first name": firstName.text.toString(),
      "last name": lastName.text.toString(),
      "email": Email.text.toString(),
      "User-Image": imgUrl,
      "age": Age.text.toString(),
      "password": userPassword.text.toString(),
    };
    SharedPreferences userCheck = await SharedPreferences.getInstance();
    if (Email.text.toString()=="admin1@gmail.com") {
      userCheck.setString('userCheck', "admin");
      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage(),));
    }
    else{
      userCheck.setString('userCheck', "user");
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    }
    FirebaseFirestore.instance.collection("users").doc(uID).set(useradd);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: firstName,
                  decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      suffixIcon: Icon(Icons.email)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: lastName,
                  decoration: InputDecoration(
                      labelText: "Enter Your last name", suffixIcon: Icon(Icons.key)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Email,
                  decoration: InputDecoration(
                      labelText: "Enter Your email", suffixIcon: Icon(Icons.key)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: userPassword,
                  decoration: InputDecoration(
                      labelText: "Enter Your password",
                      suffixIcon: Icon(Icons.male)),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: Age,
                  decoration: InputDecoration(
                      labelText: "Enter Your age",
                      suffixIcon: Icon(Icons.key)),
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