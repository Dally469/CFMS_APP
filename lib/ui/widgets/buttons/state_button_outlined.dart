import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StateOutlinedButton extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  StateOutlinedButton({
    Key? key,
    required this.backgroundColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: blueSkyOverlayColor),
          borderRadius: BorderRadius.circular(30), color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                color: blueSkyColor, fontWeight: FontWeight.w400, fontSize: 13),
          ),

        ],
      ),
    );
  }
}
