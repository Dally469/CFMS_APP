import 'package:cfms/ui/widgets/cards/donation_summary_card.dart';
import 'package:cfms/ui/widgets/lists/donation_history_item.dart';
import 'package:cfms/ui/widgets/lists/donation_item.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DonationHistoryDetails extends StatefulWidget {
  final int categoryId;
  const DonationHistoryDetails({Key? key, required this.categoryId}) : super(key: key);

  @override
  State<DonationHistoryDetails> createState() => _DonationHistoryDetailsState();
}

class _DonationHistoryDetailsState extends State<DonationHistoryDetails> {
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
          child: Text("History Details",
              style: GoogleFonts.lato(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            DonationSummaryCard(title: "Sabbath Class Lesson", backgroundColor: blueSkyOverlayColor, total: "FR 6100"),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                    itemBuilder: (context, index){
                    return DonationHistoryItem(icon: Icons.check_circle, title: "Sabbath class lesson", amount: "600", date: "03-08-2022 11:43",);
                    }
                ),
              ),
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
