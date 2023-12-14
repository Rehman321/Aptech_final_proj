// import 'package:final_proj/misc/colors.dart';
// import 'package:final_proj/widgets/gradient_button.dart';
// import 'package:final_proj/widgets/login_field.dart';
// import 'package:final_proj/widgets/social_buttons.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class LoginPage extends StatefulWidget {
//   final void Function()? onPressed;
//   const LoginPage({super.key, required this.onPressed});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//
//   final _formkey = GlobalKey<FormState>();
//
//   bool isLoading = false;
//
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   signInWithEmailAndPassword()async{
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
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
//       if (e.code == 'user-not-found') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("No user found for that email"),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         return ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Wrong Password Provided For That User."),
//           ),
//         );
//       }
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // body: SingleChildScrollView(
//       //   child: Center(
//       //     child: Column(
//       //       children: [
//       //         Image.asset("images/signin_balls.png"),
//       //         const Text("Sign In", style: TextStyle(
//       //           fontWeight: FontWeight.bold,
//       //           fontSize: 50
//       //         ),
//       //         ),
//       //         // const LoginField(hintText: 'Email',),
//       //         // const LoginField(hintText: 'Password',),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Sign In"),
//       ),
//       body: Center(
//
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formkey,
//             child: OverflowBar(
//               overflowSpacing:20,
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
//                           signInWithEmailAndPassword();
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(395, 55),
//                         backgroundColor: Colors.transparent,
//                         shadowColor: Colors.transparent,
//                       ),
//                       child:isLoading
//                           ? Center(child: const CircularProgressIndicator(color: Colors.white,))
//                           : const Text("Sign In", style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 17
//                       ),),
//
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
//                       child: const Text("Sign Up",style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 17
//                       ) ,),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Admin/admin_home_page.dart';
import '../Custom_page_routes.dart';
import '../home_page.dart';
import '../misc/colors.dart';
import 'forgot_password.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final _emailController = TextEditingController();
  final _passwrodController = TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwrodController.text.trim(),
    );
    if(FirebaseAuth.instance.currentUser!.email == "admin1@gmail.com"){
      Navigator.push(
        context,
        CustomPageRoute(
          builder: (context) => AdminHomePage(),
        ),
      );
    }
    else{
      Navigator.push(
        context,
        CustomPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }
@override
  void dispose() {
    _emailController.dispose();
    _passwrodController.dispose();
    super.dispose();
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
                Icon(Icons.android,
                  size: 100,
                  color: Colors.black,
                ),
                SizedBox(height: 70,),
                //Welcome Text
                Text('Welcome !',
                style:GoogleFonts.bebasNeue(
                  fontSize: 46,
                  color: Colors.black,
                ),
                ),
                SizedBox(height: 20,),
                Text('Let\'s Log In',
                  style: TextStyle(
                      fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 50,),
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
                      hintText: 'Enter Your Email',
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
                    obscureText: true,
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

                      hintText: 'Enter Your Password',
                      fillColor: Pallete.borderColor,
                      filled: true,

                    ),
                  ),
                ),                //forgot password
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                          },
                          ),
                          );
                        },
                        child: Text('Forgot Password',
                          style:TextStyle(
                              color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                //sign in button

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(child: Text('Sign In',
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
                    Text('Not a member?',
                      style: TextStyle(
                  fontWeight: FontWeight.bold,
                        color: Colors.black,
                ),),


                    GestureDetector(
                      onTap:widget.showRegisterPage,
                      child: Text(' Register Now',
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

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:final_proj/Admin/admin_home_page.dart';
// import 'package:final_proj/home_page.dart';
// import 'package:final_proj/misc/colors.dart';
// import 'forgot_password.dart';
//
// class LoginPage extends StatefulWidget {
//   final VoidCallback showRegisterPage;
//   const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   Future<void> signIn() async {
//     try {
//       await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//
//       if (FirebaseAuth.instance.currentUser!.email == "admin@gmail.com") {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => AdminHomePage()),
//         );
//       } else {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       print("Error: $e");
//       // Handle authentication errors here
//     }
//   }
//
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.android,
//                   size: 100,
//                   color: Colors.black,
//                 ),
//                 SizedBox(height: 70),
//                 Text(
//                   'Welcome !',
//                   style: TextStyle(
//                     fontSize: 46,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Let\'s Log In',
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 50),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Pallete.gradient2, width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Enter Your Email',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Pallete.borderColor),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Pallete.gradient2, width: 2),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       hintText: 'Enter Your Password',
//                       fillColor: Pallete.borderColor,
//                       filled: true,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                           );
//                         },
//                         child: Text(
//                           'Forgot Password',
//                           style: TextStyle(
//                             color: Colors.blueAccent,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: GestureDetector(
//                     onTap: signIn,
//                     child: Container(
//                       padding: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Center(
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 25),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not a member?',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: widget.showRegisterPage,
//                       child: Text(
//                         ' Register Now',
//                         style: TextStyle(
//                           color: Colors.blueAccent,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
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

