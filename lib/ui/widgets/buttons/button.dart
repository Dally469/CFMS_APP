import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActiveButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double height;
  final double width;
  final String title;
  const ActiveButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.width,
    required this.title,
    this.iconColor = whiteColor,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Icon(
              icon,
              color: iconColor,
              size: height / 2,
            ),
          SizedBox(width: 10,),
          Text(
            title,
            style: GoogleFonts.lato(
              color: whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}