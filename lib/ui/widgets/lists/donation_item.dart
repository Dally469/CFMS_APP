import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double height;
  final String title;
  final String amount;
  const DonationItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    this.iconColor = primaryOverlayColor,
    this.backgroundColor = whiteColor,
    this.height = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: iconColor,
                size: height / 2,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 13),
                  ),
                  Text(
                    "RF " +amount,
                    style: GoogleFonts.lato(
                        color: blackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
