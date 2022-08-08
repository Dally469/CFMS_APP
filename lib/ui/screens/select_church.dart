import 'package:cfms/ui/screens/dashboard.dart';
import 'package:cfms/ui/screens/new_donation.dart';
import 'package:cfms/ui/screens/select_country.dart';
import 'package:cfms/ui/widgets/cards/choose_church.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/buttons/state_button.dart';

class SelectChurch extends StatefulWidget {
  const SelectChurch({Key? key}) : super(key: key);

  @override
  State<SelectChurch> createState() => _SelectChurchState();
}

class _SelectChurchState extends State<SelectChurch> {
  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Icon(
              Icons.arrow_back,
              color: primaryColor,
            )),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Heading(
                title: "Select Church",
                subtitle: "Choose church you are going to make donation "),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(6),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  id == 1
                                      ? Container(
                                          height: 18,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greenColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
                                              color: whiteColor,
                                            ),
                                          ),
                                        )
                                      : Radio(
                                          value: 1,
                                          groupValue: id,
                                          activeColor: greenColor,
                                          onChanged: (val) {
                                            setState(() {
                                              id = 1;
                                              print("Home church selected");
                                            });
                                          },
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.church_rounded,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Home (Kabeza)",
                                        style: GoogleFonts.lato(
                                            color: blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(6),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 1, color : id ==2 ? greenColor : whiteColor),
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
                                  id == 2
                                      ? Container(
                                          height: 18,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greenColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
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
                                              print("Visit church selected");
                                            });
                                          },
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.church_rounded,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Visit Church ",
                                        style: GoogleFonts.lato(
                                            color: blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(6),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 1, color : id == 3 ? greenColor : whiteColor),
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
                                  id == 3
                                      ? Container(
                                          height: 18,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greenColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
                                              color: whiteColor,
                                            ),
                                          ),
                                        )
                                      : Radio(
                                          value: 3,
                                          groupValue: id,
                                          activeColor: greenColor,
                                          onChanged: (val) {
                                            setState(() {
                                              id = 3;
                                              print("Annonymous selected");
                                            });
                                          },
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.church_rounded,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Annonymous",
                                        style: GoogleFonts.lato(
                                            color: blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                       Expanded(
                        flex: 1,
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(6),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 1, color : id == 4 ? greenColor : whiteColor),
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
                                  id == 4
                                      ? Container(
                                          height: 18,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 15),
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: greenColor),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
                                              color: whiteColor,
                                            ),
                                          ),
                                        )
                                      : Radio(
                                          value: 4,
                                          groupValue: id,
                                          activeColor: greenColor,
                                          onChanged: (val) {
                                            setState(() {
                                              id = 4;
                                              print("Other selected");
                                            });
                                          },
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.church_rounded,
                                        color: primaryColor,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Others",
                                        style: GoogleFonts.lato(
                                            color: blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  
                 Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewDonation()));
                },
                child: StateButton(
                    icon: Icons.arrow_forward,
                    backgroundColor: primaryColor,
                    width: 200,
                    title: "Continue"),
              ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
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
