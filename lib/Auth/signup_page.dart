import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../misc/colors.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignUpPage({super.key, required this.onPressed});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  createUserWithEmailAndPassword()async{

    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
      if (e.code == 'weak-password') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('The password provided is too weak.'),
          ),
        );

      } else if (e.code == 'email-already-in-use') {
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("The account already exists for that email."),
          ),
        );
        print('The account already exists for that email.');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SignUp"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: OverflowBar(
              overflowSpacing: 30,
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
                          createUserWithEmailAndPassword();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(395, 55),
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      child:isLoading
                          ? Center(child: const CircularProgressIndicator(color: Colors.white,))
                          :  const Text("SignUp",style: TextStyle(
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
                      child:const Text("Login",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17
                      ),
                    ),
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
