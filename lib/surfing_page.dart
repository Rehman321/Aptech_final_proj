import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurfingPage extends StatefulWidget {
  const SurfingPage({super.key});

  @override
  State<SurfingPage> createState() => _SurfingPageState();
}

class _SurfingPageState extends State<SurfingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Surfing Page"),
      ),
    );
  }
}
