import 'package:final_proj/Auth/login_page.dart';
import 'package:final_proj/Auth/signup_page.dart';
import 'package:flutter/cupertino.dart';

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {

  bool isLogin = true;

  void togglePage(){
    setState(() {
      isLogin= !isLogin;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return LoginPage(onPressed:togglePage,);
    }else{
      return  SignUpPage(onPressed:togglePage,);
    }
  }
}
