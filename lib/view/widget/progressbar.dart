import 'package:flutter/material.dart';

class ProgramsBar extends StatelessWidget {
  const ProgramsBar({
    Key? key, required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle( fontFamily: 'Hacen',color:Colors.blue.shade900,fontWeight: FontWeight.bold,fontSize: 23),
          ),

        ],
      ),
    );
  }
}