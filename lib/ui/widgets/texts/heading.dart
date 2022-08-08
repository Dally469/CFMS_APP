import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;
  Heading({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text(
              title,
                textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: primaryColor, fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: blackColor, fontWeight: FontWeight.w300, fontSize: 17),
            ),
          ),
          SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}
