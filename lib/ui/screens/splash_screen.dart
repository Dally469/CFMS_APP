import 'dart:async';

import 'package:cfms/ui/screens/select_language.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 4), () => {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => SelectLanguage()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/icons/logo.png", width: 180, height: 180, color: whiteColor,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Rwanda",
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w900,
                      color: whiteColor,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 90),
                child: Text(
                  "Church Financial Management System",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      color: whiteColor,
                      fontSize: 25),
                ),
              ),
            ],
          ),
        ),
       
        Positioned(
          bottom: 60,
          left: 80,
          right: 80,
          child: Center(
            child: SpinKitDoubleBounce(
              color: orangeColor,
            ),
          ),
        ),
      ]),
    );
  }
}
