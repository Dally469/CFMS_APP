import 'package:cfms/ui/screens/select_country.dart';
import 'package:cfms/ui/widgets/buttons/button.dart';
import 'package:cfms/ui/widgets/buttons/state_button.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/lists/language_item.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  int id = 1;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Heading(
                  title: " Language",
                  subtitle: "Choose language do you wish to use ?"),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(width: 1, color : id == 1 ? greenColor : whiteColor),
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
                                "assets/images/icons/eng.png",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "English",
                                style: GoogleFonts.lato(
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                              )
                            ],
                          ),
                          id == 1
                              ? Container(
                                  height: 30,
                                  margin: EdgeInsets.symmetric(horizontal: 15),
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greenColor),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color: whiteColor,
                                    ),
                                  ),
                                )
                              : Container(

                                child: Radio(
                                    value: 1,
                                    groupValue: id,
                                    activeColor: greenColor,
                                    onChanged: (val) {
                                      setState(() {
                                        id = 1;
                                        print("English selected");
                                      });
                                    },
                                  ),
                              )
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(width: 1, color : id == 2 ? greenColor : whiteColor),
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
                                "assets/images/icons/swa.png",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Kiswahili",
                                style: GoogleFonts.lato(
                                    color: blackColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17),
                              )
                            ],
                          ),
                          id == 2
                              ? Container(
                                  height: 30,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: greenColor),
                                  child: Center(
                                    child: Icon(
                                      Icons.check,
                                      size: 14,
                                      color: whiteColor,
                                    ),
                                  ),
                                )
                              : Radio(
                                  value: 2,
                                  groupValue: id,
                                  activeColor: greenColor,
                                  onChanged: (val) {
                                    setState(() {
                                      id = 2;
                                      print("Kiswahili selected");
                                    });
                                  },
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                    Navigator.push(
              context, MaterialPageRoute(builder: (context) => SelectCountry()));
                  
                },
                child: StateButton(
                    icon: Icons.arrow_forward,
                    backgroundColor: primaryColor,
                    width: 200,
                    title: "Continue"),
              )
            ],
          )
        ],
      )),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo/logo.png",
            scale: 2,
            height: 50,
            color: primaryOverlayColor,
            width: 50,
          ),
        ],
      ),
    );
  }
}
