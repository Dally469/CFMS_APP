import 'package:cfms/ui/widgets/buttons/button.dart';
import 'package:cfms/ui/widgets/buttons/loading_button.dart';
import 'package:cfms/ui/widgets/buttons/state_button.dart';
import 'package:cfms/ui/widgets/cards/choose_church.dart';
import 'package:cfms/ui/widgets/cards/dashboard_card.dart';
import 'package:cfms/ui/widgets/cards/donation_summary_card.dart';
import 'package:cfms/ui/widgets/cards/member_card.dart';
import 'package:cfms/ui/widgets/icons/bold_app_icon.dart';
import 'package:cfms/ui/widgets/inputs/text_field.dart';
import 'package:cfms/ui/widgets/lists/donation_item.dart';
import 'package:cfms/ui/widgets/lists/language_item.dart';
import 'package:cfms/ui/widgets/lists/payment_item.dart';
import 'package:cfms/ui/widgets/payments/payment_confirmation.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/icons/overlay_app_icon.dart';

class Components extends StatefulWidget {
  const Components({Key? key}) : super(key: key);

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [

                Text("My Input "),
                InputData(),
                Text("My Buttons"),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StateButton(
                        icon: Icons.add,
                        backgroundColor: orangeColor,
                        width: 150,
                        title: "Add More"),
                    ActiveButton(
                        icon: Icons.home,
                        backgroundColor: primaryColor,
                        width: 150,
                        title: "Continue"),
                    LoadingButton(
                      icon: Icons.home,
                      backgroundColor: primaryColor,
                      width: 150,
                      title: "Continue",
                      isLoading: true,
                    ),
                  ],
                ),
                Text("My List"),
                LanguageItem(
                  flag: "assets/images/icons/eng.png",
                  backgroundColor: whiteColor,
                  title: "English",
                  isSelected: true,
                ),
                DonationItem(icon: Icons.church_rounded, title: "Tithe", amount: "1000"),
                Text("My App Icons"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoldAppIcon(icon: Icons.arrow_back),
                    OverlayAppIcon(icon: Icons.arrow_back)
                  ],
                ),
                Text("My Cards"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChooseChurchCard(
                      icon: Icons.church_rounded,
                      backgroundColor: whiteColor,
                      title: "Home",
                      isSelected: true,
                    ),
                    DonationSummaryCard(
                      title: "Monthly Donations",
                      backgroundColor: whiteColor,
                      total: "RF 50,000 ",
                    ),
                    MemberCard(name: "John Doe Ngiruwonsanga Emmanuel", phone: "0789000000", church: "Kajevuba", photo: "assets/images/icons/eng.png"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DashboardCard(
                            icon: Icons.add,
                            backgroundColor: whiteColor,
                            title: "New Donation", btnTitle: "ds", desc: "ddd",),
                        DashboardCard(
                            icon: Icons.history,
                            backgroundColor: whiteColor,
                            title: "History", btnTitle: "ds", desc: "ddd",),
                      ],
                    )
                  ],
                ),
                PaymentConfirmation(title: "Payment", amount: "5000"),
                Row(
                  children: [
                    PaymentItem(flag: "assets/images/logo/momo.png", backgroundColor: whiteColor, title: "Mobile Money", isSelected: true),
                    PaymentItem(flag: "assets/images/logo/card.png", backgroundColor: whiteColor, title: "Master Card", isSelected: false),
                   
                  ],
                ),
                 Row(
                  children: [
                  
                    PaymentItem(flag: "assets/images/logo/cheque.png", backgroundColor: whiteColor, title: "Cheque book", isSelected: false),
                    PaymentItem(flag: "assets/images/logo/card.png", backgroundColor: whiteColor, title: "Other Number", isSelected: false),
                  ],
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
