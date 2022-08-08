import 'package:cfms/ui/screens/approved_payment.dart';
import 'package:cfms/ui/screens/payments/confirmation.dart';
import 'package:cfms/ui/widgets/buttons/state_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../widgets/texts/heading.dart';
class Payment extends StatefulWidget {
  final double totalAmount;
  const Payment({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int id = 0;
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
                title: "Payment ",
                subtitle: "Choose payment method wallet you want to use "),
            Column(
              children: [
                Text("Total Amount",textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: primaryOverlayColor, fontWeight: FontWeight.w300),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    "RF "+widget.totalAmount.toStringAsFixed(0),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        color: greenColor, fontWeight: FontWeight.w700, fontSize: 35),
                  ),

                ),
                Container(
                  width: 50,
                  height: 6,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greenOverlayColor,
                  ),

                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(
                                "assets/images/logo/momo.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Mobile Money",
                                    style: GoogleFonts.lato(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                         fontSize: 13),
                                  ),
                                  id == 1
                                      ? Container(
                                    height: 20,
                                    margin: EdgeInsets.all(15),
                                    padding: EdgeInsets.all(2),
                                    decoration:
                                    BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 60 / 4,
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
                                        print("Momo selected");
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(
                                "assets/images/logo/card.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Card payment ",
                                    style: GoogleFonts.lato(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                         fontSize: 13),
                                  ),
                                  id == 2
                                      ? Container(
                                    height: 20,
                                    margin: EdgeInsets.all(15),
                                    padding: EdgeInsets.all(2),
                                    decoration:
                                    BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 60 / 4,
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
                                        print("Card selected");
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(
                                "assets/images/logo/cheque.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Bank Teller ",
                                    style: GoogleFonts.lato(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                         fontSize: 13),
                                  ),
                                  id == 3
                                      ? Container(
                                    height: 20,
                                    margin: EdgeInsets.all(15),
                                    padding: EdgeInsets.all(2),
                                    decoration:
                                    BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 60 / 4,
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
                                        print("bANK selected");
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 10,),
                              Image.asset(
                                "assets/images/logo/other.png",
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " Other number ",
                                    style: GoogleFonts.lato(
                                        color: blackColor,
                                        fontWeight: FontWeight.w400,
                                         fontSize: 13),
                                  ),
                                  id == 4
                                      ? Container(
                                    height: 20,
                                    margin: EdgeInsets.all(15),
                                    padding: EdgeInsets.all(2),
                                    decoration:
                                    BoxDecoration(shape: BoxShape.circle, color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 60 / 4,
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
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () {

                Navigator.push( context, MaterialPageRoute(builder: (context) => ConfirmPayment(methodId: id, totalAmount: widget.totalAmount,)));
              },
              child: StateButton(
                  icon: Icons.arrow_forward,
                  backgroundColor: primaryColor,
                  width: 200,
                  title: "Continue"),
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
