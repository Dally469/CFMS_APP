import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DonationHistoryItem extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final String title;
  final String amount;
  final String date;
  const DonationHistoryItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.amount,
    required this.date,
    this.iconColor = primaryColor,
    this.backgroundColor = whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        color: blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    "RF"+amount,
                    style: GoogleFonts.lato(
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  Text(
                    date,
                    style: GoogleFonts.lato(
                        color: blackColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
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
