import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatefulWidget {
  final String iconPath;
  final String label;
  const SocialButton({Key? key, required this.iconPath, required this.label}): super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed:(){},
        icon:SvgPicture.asset("iconPath",width: 30,),
      label: Text("label"),
    );
  }
}


