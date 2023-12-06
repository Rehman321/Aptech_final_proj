// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../misc/colors.dart';
//
// class SignUpPage extends StatefulWidget {
//   final void Function()? onPressed;
//   const SignUpPage({super.key, required this.onPressed});
//
//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formkey = GlobalKey<FormState>();
//
//   bool isLoading = false;
//
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   final TextEditingController _firstname = TextEditingController();
//   final TextEditingController _lastname = TextEditingController();
//   final TextEditingController _age = TextEditingController();
//
//   createUserWithEmailAndPassword()async{
//
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: _email.text,
//         password: _password.text,
//       );
//       setState(() {
//         isLoading = false;
//       });
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       if (e.code == 'weak-password') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('The password provided is too weak.'),
//           ),
//         );
//
//       } else if (e.code == 'email-already-in-use') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("The account already exists for that email."),
//           ),
//         );
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       print(e);
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("SignUp"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formkey,
//             child: OverflowBar(
//               overflowSpacing: 30,
//               children: [
//                 TextFormField(
//                   controller: _email,
//                   validator: (text){
//                     if(text == null || text.isEmpty){
//                       return "Email is empty";
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.all(27),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Pallete.borderColor,
//                         width: 3,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Pallete.gradient2,
//                         width: 3,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                   ),
//                 ),
//                 TextFormField(
//                   controller: _password,
//                   validator: (text){
//                     if(text == null || text.isEmpty){
//                       return "Password is empty";
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.all(27),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Pallete.borderColor,
//                         width: 3,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: const BorderSide(
//                         color: Pallete.gradient2,
//                         width: 3,
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//
//                   ),
//                 ),
//
//                 SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(colors: [
//                         Pallete.gradient1,
//                         Pallete.gradient2,
//                         Pallete.gradient3,
//                       ],
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: (){
//                         if(_formkey.currentState!.validate()){
//                           createUserWithEmailAndPassword();
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(395, 55),
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       child:isLoading
//                           ? Center(child: const CircularProgressIndicator(color: Colors.white,))
//                           :  const Text("SignUp",style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 17
//                       ),),
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(
//                   width: double.infinity,
//                   height: 45,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(colors: [
//                         Pallete.gradient1,
//                         Pallete.gradient2,
//                         Pallete.gradient3,
//                       ],
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: widget.onPressed,
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(395, 55),
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       child:const Text("Login",style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 17
//                       ),
//                     ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_proj/misc/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwrodController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwrodController.dispose();
    _confirmpassController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future signUp() async{

   if(passConfirmed()){
     //user created
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: _emailController.text.trim(),
       password: _passwrodController.text.trim(),
     );
     //add user details
     addUserDatails(
         _firstNameController.text.trim(),
       _lastNameController.text.trim(),
       _emailController.text.trim(),
       int.parse(_ageController.text.trim()),
     );
   }
  }

  Future addUserDatails(String firstName, String lastName, String email, int age) async{
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'age': age,



    });
  }

bool passConfirmed(){
if(_passwrodController.text.trim() == _confirmpassController.text.trim()){
  return true;
}else{
  return false;
}
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text('Let\'s Register',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50,),

                // firstname textfield
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'First Name',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                // lastname textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Last Name',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // age textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _ageController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Age',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Email',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20,),



                //password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _passwrodController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Password',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _confirmpassController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Pallete.gradient2,width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      hintText: 'Password',
                      fillColor: Pallete.borderColor,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                //sign in button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign Up',
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
                //sign up

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have Account?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),),


                    GestureDetector(
                      onTap:widget.showLoginPage,
                      child: Text(' Login Now',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

