import 'package:final_proj/misc/colors.dart';
import 'package:final_proj/widgets/gradient_button.dart';
import 'package:final_proj/widgets/login_field.dart';
import 'package:final_proj/widgets/social_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  const LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  signInWithEmailAndPassword()async{
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _password.text,
      );
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("No user found for that email"),
          ),
        );
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Wrong Password Provided For That User."),
          ),
        );
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Center(
      //     child: Column(
      //       children: [
      //         Image.asset("images/signin_balls.png"),
      //         const Text("Sign In", style: TextStyle(
      //           fontWeight: FontWeight.bold,
      //           fontSize: 50
      //         ),
      //         ),
      //         // const LoginField(hintText: 'Email',),
      //         // const LoginField(hintText: 'Password',),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In"),
      ),
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: OverflowBar(
              overflowSpacing:20,
              children: [
                TextFormField(
                  controller: _email,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return "Email is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.gradient2,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
                TextFormField(
                  controller: _password,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return "Password is empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(27),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.borderColor,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Pallete.gradient2,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Pallete.gradient1,
                        Pallete.gradient2,
                        Pallete.gradient3,
                      ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: (){
                        if(_formkey.currentState!.validate()){
                          signInWithEmailAndPassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(395, 55),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child:isLoading
                          ? Center(child: const CircularProgressIndicator(color: Colors.white,))
                          : const Text("Sign In", style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17
                      ),),

                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Pallete.gradient1,
                        Pallete.gradient2,
                        Pallete.gradient3,
                      ],
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(395, 55),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child: const Text("Sign Up",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17
                      ) ,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
