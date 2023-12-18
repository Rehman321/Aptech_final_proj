import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttractionWidget extends StatelessWidget {
  final String attName;
  final String attDescription;
  final String attImageUrl;

  AttractionWidget({
    required this.attName,
    required this.attDescription,
    required this.attImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            attImageUrl,
            fit: BoxFit.fill,
            width: double.infinity,
            height: 250, // Adjust the height as needed
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
            ),
            child: Text(
              attName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
