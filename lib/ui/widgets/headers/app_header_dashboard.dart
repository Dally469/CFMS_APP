import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderDashboard extends StatefulWidget {
 
  final String title;
  
  const AppHeaderDashboard({
    Key? key,
    required this.title,
  }) : super(key: key);


  @override
  State<AppHeaderDashboard> createState() => _AppHeaderDashboardState();
}

class _AppHeaderDashboardState extends State<AppHeaderDashboard> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back),
      title: Text(widget.title, style: GoogleFonts.lato(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20)),
    );
  }
}