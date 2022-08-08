import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseChurchCard extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double height;
  final String title;
  final bool isSelected;
  const ChooseChurchCard({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.title,
    required this.isSelected,
    this.iconColor = primaryColor,
    this.height = 75,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected ? Container(
                  height: height / 4,
                  margin: EdgeInsets.all(2),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: greenColor
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: height / 5,
                      color: backgroundColor,
                    ),
                  ),
                ) : Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                      size: height / 3,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.lato(
                          color: blackColor, fontWeight: FontWeight.w400, fontSize: 14),
                    )
                  ],
                ),
                SizedBox(height: 2,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
