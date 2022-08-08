import 'package:cfms/ui/screens/donation_history.dart';
import 'package:cfms/ui/screens/new_donation.dart';
import 'package:cfms/ui/screens/select_church.dart';
import 'package:cfms/ui/widgets/cards/dashboard_card.dart';
import 'package:cfms/ui/widgets/cards/member_card.dart';
import 'package:cfms/ui/widgets/headers/app_header_dashboard.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        title: Text("Dashboard",
            style: GoogleFonts.lato(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            MemberCard(
                name: "Dally Jones",
                phone: "(+250) 785-000-000",
                church: "Kabeza Church",
                photo: "assets/images/icons/user.png"),
            Column(
              children: [
                InkWell(
                  onTap: (){
                     Navigator.push(
              context, MaterialPageRoute(builder: (context) => SelectChurch()));
                  },
                  child: DashboardCard(
                    icon: Icons.wallet,
                    backgroundColor: whiteColor,
                    title: "New Donation",
                    btnTitle: "Add new",
                    desc: "Church donation",
                  ),
                ),
                InkWell(
                   onTap: (){
                     Navigator.push(
              context, MaterialPageRoute(builder: (context) => HistoryDonation()));
                  },
                  child: DashboardCard(
                    icon: Icons.history,
                    backgroundColor: whiteColor,
                    title: "History",
                    btnTitle: "View all",
                    desc: "All histories",
                  ),
                ),
              ],
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
