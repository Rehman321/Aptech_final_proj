import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HuntingPage extends StatefulWidget {
  const HuntingPage({super.key});

  @override
  State<HuntingPage> createState() => _HuntingPageState();
}

class _HuntingPageState extends State<HuntingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hunting Page"),
      ),
    );
  }
}
