import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_proj/home_page.dart';
import 'package:final_proj/Auth/login_or_signup.dart';
import 'package:final_proj/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Admin/admin_home_page.dart';
import '../Admin/user_fetch_page.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot){
          if(snapshot.connectionState ==  ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else{
            if(snapshot.hasData){
              return  UserFetchPage();
            }else{
              return const LoginAndSignup();
            }
          }
        },
      ),
    );
  }
}
