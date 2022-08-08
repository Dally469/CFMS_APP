import 'package:cfms/services/db/db_helper.dart';
import 'package:cfms/services/provider/donation_provider.dart';
import 'package:cfms/ui/screens/dashboard.dart';
import 'package:cfms/ui/widgets/buttons/button.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ApprovalPayment extends StatefulWidget {
  final int method;
  final double totalAmount;
  const ApprovalPayment(
      {Key? key, required this.method, required this.totalAmount})
      : super(key: key);

  @override
  State<ApprovalPayment> createState() => _ApprovalPaymentState();
}

class _ApprovalPaymentState extends State<ApprovalPayment> {
  String title = '';
  DbHelper? _dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    if (widget.method == 1) {
      title = "Mobile Money";
    } else if (widget.method == 2) {
      title = "ATM Card ";
    } else if (widget.method == 3) {
      title = "Bank Cheque";
    } else {
      title = "Other number";
    }
    return ChangeNotifierProvider(
        create: (_) => DonationProvider(),
        child: Builder(builder: (BuildContext context) {
          final donation = Provider.of<DonationProvider>(context);
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
                    Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 160,
                    ),
                    Heading(
                        title: "Success ",
                        subtitle: "Your " +
                            title +
                            " payment has been made successfully "),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: Text(
                        "RF " + widget.totalAmount.toStringAsFixed(0),
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w600,
                            fontSize: 45,
                            color: primaryColor),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard()));
                              _dbHelper?.deleteAll();
                              donation.removeAllCounter();
                              donation.resetTotalAmount();

                            },
                            child: ActiveButton(
                                icon: Icons.arrow_back,
                                backgroundColor: greenColor,
                                width: 130,
                                title: "Back")),
                      ],
                    )
                  ]),
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
        }));
  }
}
