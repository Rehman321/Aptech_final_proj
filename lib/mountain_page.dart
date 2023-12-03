import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MountainsPage extends StatefulWidget {
  const MountainsPage({super.key});

  @override
  State<MountainsPage> createState() => _MountainsPageState();
}

class _MountainsPageState extends State<MountainsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Mountains Page"),
      ),
    );
  }
}
