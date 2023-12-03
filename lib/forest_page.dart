import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForestPage extends StatefulWidget {
  const ForestPage({super.key});

  @override
  State<ForestPage> createState() => _ForestPageState();
}

class _ForestPageState extends State<ForestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hunting Page"),
      ),
    );
  }
}
