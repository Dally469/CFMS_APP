import 'package:cfms/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentConfirmation extends StatelessWidget {
  final Color backgroundColor;
  final double height;
  final String title;
  final String amount;
  const PaymentConfirmation({
    Key? key,
    required this.title,
    required this.amount,
    this.backgroundColor = whiteColor,
    this.height = 140,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  "Total",
                  style: GoogleFonts.lato(
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                child: Text(
                  amount,
                  style: GoogleFonts.lato(
                      color: blackColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
                ),
              ),
              SizedBox(
            height: 2,
          ),
          InkWell(
            onTap: () {
              final action = CupertinoActionSheet(
              title: Text(
                title,
                style: GoogleFonts.lato(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22),
              ),
              message:  Text(
                "Select any action ",
                style: TextStyle(fontSize: 15.0),
              ),
              actions: <Widget>[
                CupertinoActionSheetAction(
                  child: Text("Action 1"),
                  isDefaultAction: false,
                  onPressed: () {
                    print("Action 1 is been clicked");
                  },
                ),
                CupertinoActionSheetAction(
                  child: Text("Action 2"),
                  isDestructiveAction: true,
                  onPressed: () {
                    print("Action 2 is been clicked");
                  },
                )
              ],
              cancelButton: CupertinoActionSheetAction(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
            showCupertinoModalPopup(
                context: context, builder: (context) => action);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: primaryColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wallet,
                    color: whiteColor,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        color: whiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  )
                ],
              ),
            ),
          )
            ],
          ),
          
        ],
      ),
    );
  }
}
