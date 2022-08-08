import 'package:cfms/ui/screens/donation_history_details.dart';
import 'package:cfms/ui/widgets/cards/donation_category.dart';
import 'package:cfms/ui/widgets/cards/donation_summary_card.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryDonation extends StatefulWidget {
  const HistoryDonation({Key? key}) : super(key: key);

  @override
  State<HistoryDonation> createState() => _HistoryDonationState();
}

class _HistoryDonationState extends State<HistoryDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(
          child: Text("History",
              style: GoogleFonts.lato(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DonationSummaryCard(title: "All Donations", backgroundColor: blueSkyOverlayColor, total: "FR 150,000"),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        DonationCategoryCard(title: "Tithe", amount: "3500", lastDate: "12-7-2022"),
                        DonationCategoryCard(title: "Thanksgiving", amount: "8500", lastDate: "03-7-2022"),
                      ],
                    ),
                    Row(
                      children: [
                        DonationCategoryCard(title: "Camp meeting", amount: "2300", lastDate: "12-7-2022"),
                        DonationCategoryCard(title: "Sabbath Class Lesson", amount: "6100", lastDate: "03-7-2022"),
                      ],
                    ),
                    Row(
                      children: [
                        DonationCategoryCard(title: "Construction", amount: "700", lastDate: "12-7-2022"),
                        DonationCategoryCard(title: "Offerings", amount: "1500", lastDate: "03-7-2022"),
                      ],
                    ),
                  ],
                ),
              )

            ],
          ),
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
