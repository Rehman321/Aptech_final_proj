import 'package:flutter/cupertino.dart';

class UpdateUserPage extends StatefulWidget {

  String firstname;
  String lastname;
  String email;
  String password;
  UpdateUserPage({required this.firstname, required this.lastname, required this.email,required this.password,});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
