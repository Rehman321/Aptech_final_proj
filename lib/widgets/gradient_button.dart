import 'package:final_proj/misc/colors.dart';
import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  const GradientButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [
          Pallete.gradient1,
          Pallete.gradient2,
          Pallete.gradient3,
        ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
          onPressed:(){},
        style: ElevatedButton.styleFrom(
          fixedSize: Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text("Sign In", style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17
        ),
        ),
      ),
    );
  }
}
