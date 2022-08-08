import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MemberCard extends StatelessWidget {
  final String name;
  final String phone;
  final String church;
  final Color backgroundColor;
  final String photo;
  const MemberCard({
    Key? key,
    required this.name,
    required this.phone,
    required this.church,
    this.backgroundColor = whiteColor,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: blueSkyOverlayColor, width: 3)
            ),
            child: Image.asset(photo, fit: BoxFit.contain, scale: 5,)
            ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 23),
            ),
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Phone",style: GoogleFonts.lato(
                          color: blackColor, fontWeight: FontWeight.w400, fontSize: 12),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
                    child: Text(
                      phone,
                      style: GoogleFonts.lato(
                          color: blackColor, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text("Church",style: GoogleFonts.lato(
                          color: blackColor, fontWeight: FontWeight.w400, fontSize: 12),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                    child: Text(
                      church,
                      style: GoogleFonts.lato(
                          color: blackColor, fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
