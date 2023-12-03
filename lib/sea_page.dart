import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeaPage extends StatefulWidget {
  const SeaPage({super.key});

  @override
  State<SeaPage> createState() => _SeaPageState();
}

class _SeaPageState extends State<SeaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sea Page"),
      ),
    );
  }
}
