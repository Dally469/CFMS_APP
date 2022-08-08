import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageItem extends StatelessWidget {
  final Color backgroundColor;
  final String flag;
  final double height;
  final String title;
  final bool isSelected;
  LanguageItem({
    Key? key,
    required this.flag,
    required this.backgroundColor,
    required this.title,
    required this.isSelected,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(10),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                flag,
                height: height / 2,
                width: height / 2,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: GoogleFonts.lato(
                    color: blackColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 17),
              )
            ],
          ),
          isSelected
              ? Container(
                  height: 30,
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(2),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: greenColor),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: height / 3,
                      color: backgroundColor,
                    ),
                  ),
                )
              : Text(' ')
        ],
      ),
    );
  }
}
