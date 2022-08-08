import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';

class BoldAppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const BoldAppIcon({
    Key? key,
    required this.icon,
    this.backgroundColor = primaryColor,
    this.iconColor = whiteColor,
    this.size = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Stack(
        children: [
          Positioned(
            bottom: 7,
            top: 7,
            left: 4,
            right: 4,
            child: Icon(
              icon,
              color: iconColor,
              size: size / 2,
            ),
          ),

        ],
      ),
    );
  }
}