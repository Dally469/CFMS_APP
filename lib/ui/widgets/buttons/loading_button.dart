import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double height;
  final double width;
  final String title;
  final bool isLoading;

  const LoadingButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.width,
    required this.title,
    required this.isLoading,
    this.iconColor = whiteColor,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: backgroundColor),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(
                  color: whiteColor,
                  size: 20,
                )
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: GoogleFonts.lato(
                      color: whiteColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  icon,
                  color: iconColor,
                  size: height / 2,
                ),
              ],
            ),
    );
  }
}
