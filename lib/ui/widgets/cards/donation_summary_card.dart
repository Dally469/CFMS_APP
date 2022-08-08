import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationSummaryCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconColor;
  final String total;
  const DonationSummaryCard({
    Key? key,
    required this.title,
    required this.backgroundColor,
    required this.total,
    this.iconColor = primaryOverlayColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          new BoxShadow(
            offset: Offset(0.0, 5.0),
            color: Color(0xffEDEDED),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
                  title,
                  style: GoogleFonts.lato(
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 23),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Text(
                  "In Total:",
                  style: GoogleFonts.lato(
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
          ),
             
              Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  total,
                  style: GoogleFonts.lato(
                      color: blackColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 33),
                ),
              ),
          SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
