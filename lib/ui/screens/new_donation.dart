import 'dart:convert';

import 'package:another_flushbar/flushbar.dart';
import 'package:cfms/models/donations/donation.dart';
import 'package:cfms/services/db/db_helper.dart';
import 'package:cfms/services/provider/donation_provider.dart';
import 'package:cfms/ui/screens/select_payment.dart';
import 'package:cfms/ui/widgets/buttons/button.dart';
import 'package:cfms/ui/widgets/buttons/state_button.dart';
import 'package:cfms/ui/widgets/lists/donation_item.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

import '../../models/donations/category_model.dart';
import '../../utils/colors.dart';

class NewDonation extends StatefulWidget {
  const NewDonation({Key? key}) : super(key: key);

  @override
  State<NewDonation> createState() => _NewDonationState();
}

class _NewDonationState extends State<NewDonation> {
  @override
  List categoryList = [
    {'value': "1", 'text': "Tithe"},
    {'value': "2", 'text': "Camp meeting"},
    {'value': "3", 'text': "Construction"},
    {'value': "4", 'text': "Djibouti"},
    {'value': "5", 'text': "Tithe"},
    {'value': "6", 'text': "Harvesting"},
    {'value': "7", 'text': "Ibirundo"},
    {'value': "8", 'text': "Offerings"},
    {'value': "9", 'text': "Sabbath School leson"},
  ];

  final formGlobalKey = GlobalKey<FormState>();
  String? selectedValue;
  String? selectedText = "Donation";
  TextEditingController amountController = TextEditingController();
  DbHelper? _dbHelper = DbHelper();
  bool _isConfirmed = false;

  RegExp digitValidator = RegExp(r'^[0-9]+$');
  bool isANumber = true;
  bool isClicked = false;
  bool viewAll = true;

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return ChangeNotifierProvider(
        create: (_) => DonationProvider(),
        child: Builder(builder: (BuildContext context) {
          final donation = Provider.of<DonationProvider>(context);
          return Scaffold(
            key: _scaffoldKey,
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
                child: Text("Donation",
                    style: GoogleFonts.lato(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Icon(
                        Icons.view_agenda_outlined,
                        color: primaryColor,
                      )),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Center(
                child: viewAll
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Heading(
                              title: "New Donation",
                              subtitle:
                                  "Select all category of donation you want to give"),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Form(
                              key: formGlobalKey,
                              child: Column(
                                children: [
                                  DropdownButtonFormField<String>(
                                    value: selectedValue,
                                    items: categoryList
                                        .map((label) => DropdownMenuItem<String>(
                                              child: Text(label['text']),
                                              // value: label['value'],
                                              value: label.toString()
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {

                                        selectedValue = value;
                                        print(value);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Select Donation category',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: amountController,
                                      onChanged: (inputValue) {
                                        if (inputValue.isEmpty ||
                                            digitValidator.hasMatch(inputValue)) {
                                          setValidator(true);
                                        } else {
                                          setValidator(false);
                                        }
                                      },
                                      decoration: InputDecoration(
                                        errorText: isANumber
                                            ? null
                                            : "Please enter valid a number",
                                        hintText: 'Amount',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _dbHelper
                                          ?.insert(DonationModel(
                                              int.parse(selectedValue.toString()),
                                              selectedValue.toString(),
                                              "Thihe",
                                              int.parse(
                                                  amountController.text)))
                                          .then((value) {
                                        donation
                                            .addTotalAmount(double.parse(amountController.text));
                                        donation.addCounter();
                                        amountController.text = '';
                                        selectedValue = null;

                                        Flushbar(
                                              title: "Added",
                                              message: "Donation added to list you going to give",
                                              icon: Icon(
                                                Icons.check_circle_outline,
                                                size: 28.0,
                                                color: Colors.white,
                                              ),
                                              duration: Duration(seconds: 5),
                                              margin: EdgeInsets.all(10),
                                              borderRadius: BorderRadius.circular(10),
                                              flushbarPosition: FlushbarPosition.TOP,
                                              flushbarStyle: FlushbarStyle.FLOATING,
                                              reverseAnimationCurve: Curves.decelerate,
                                              forwardAnimationCurve: Curves.elasticOut,
                                              backgroundColor: Colors.green,
                                            )..show(context);

                                      }).onError((error, stackTrace) {
                                        print(error.toString());
                                      });
                                    },
                                    child: ActiveButton(
                                        icon: Icons.add,
                                        backgroundColor: greenColor,
                                        width: MediaQuery.of(context).size.width,
                                        title: "Add Donation"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Consumer<DonationProvider>(
                              builder: (context, value, child) {
                            return Visibility(
                              visible: value.getTotalAmount().toStringAsFixed(2)  == "0.00" ? false : true,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                                decoration: BoxDecoration(
                                  color: whiteColor,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "Total Amount",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Consumer<DonationProvider>(
                                            builder: (context, value, child) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                child: Text(
                                                    "FRW " +
                                                        value
                                                            .getTotalAmount()
                                                            .toStringAsFixed(0),
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    viewAll = false;
                                                  },
                                                  child: Badge(

                                                    badgeContent: Consumer<DonationProvider>(
                                                      builder: (context, value, child) {
                                                        return Text(value.getCounter().toString(),style: TextStyle(
                                                            color: Colors.white));
                                                      },
                                                    ),
                                                    badgeColor: greenColor,
                                                    position:
                                                        BadgePosition.topStart(
                                                            top: -2, start: 1),
                                                    padding: EdgeInsets.all(10),
                                                    child: ActiveButton(
                                                        icon: Icons.list,
                                                        backgroundColor:
                                                            orangeColor,
                                                        width: 150,
                                                        title: "View All"),
                                                  )),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _isConfirmed = true;
                                                    new Future.delayed(
                                                        new Duration(seconds: 2),
                                                        () {
                                                      new Future.delayed(
                                                          new Duration(
                                                              seconds: 25), () {
                                                        donation
                                                            .removeAllCounter();
                                                      });

                                                      donation.removeTotalAmount(
                                                          double.parse(value
                                                              .totalAmount
                                                              .toString()));
                                                    });
                                                  });
                                                },
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Payment(totalAmount: donation.totalAmount,)));
                                                  },
                                                  child: StateButton(
                                                    icon: Icons.arrow_forward,
                                                    backgroundColor: primaryColor,
                                                    width: 150,
                                                    title: "Next",
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<DonationProvider>(
                              builder: (context, value, child) {
                                return Visibility(
                                  visible: value.getTotalAmount().toStringAsFixed(2)  == "0.00" ? false : true,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
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
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(5),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                child: Text(
                                                  "Total Amount",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Consumer<DonationProvider>(
                                                builder: (context, value, child) {
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    child: Text(
                                                        "FRW " +
                                                            value
                                                                .getTotalAmount()
                                                                .toStringAsFixed(
                                                                2),
                                                        style:
                                                        GoogleFonts.poppins(
                                                            fontSize: 20,
                                                            fontWeight:
                                                            FontWeight
                                                                .w700)),
                                                  );
                                                },
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        viewAll = true;
                                                      },
                                                      child: Badge(
                                                        badgeContent: Consumer<DonationProvider>(
                                                          builder: (context, value, child) {
                                                            return Text(value.getCounter().toString(),style: TextStyle(
                                                                color: Colors.white));
                                                          },
                                                        ),
                                                        badgeColor: greenColor,
                                                        position: BadgePosition
                                                            .topStart(
                                                            top: -2, start: 1),
                                                        padding:
                                                        EdgeInsets.all(10),
                                                        child: ActiveButton(
                                                            icon: Icons.list,
                                                            backgroundColor:
                                                            orangeColor,
                                                            width: 150,
                                                            title: "Add more"),
                                                      )),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        _isConfirmed = true;
                                                        new Future.delayed(
                                                            new Duration(
                                                                seconds: 2), () {
                                                          new Future.delayed(
                                                              new Duration(
                                                                  seconds: 25),
                                                                  () {
                                                                donation
                                                                    .removeAllCounter();
                                                              });

                                                          donation.removeTotalAmount(
                                                              double.parse(value
                                                                  .totalAmount
                                                                  .toString()));
                                                        });
                                                      });
                                                    },
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                    Payment(totalAmount: donation.totalAmount,)));
                                                      },
                                                      child: StateButton(
                                                        icon: Icons.arrow_forward,
                                                        backgroundColor:
                                                        primaryColor,
                                                        width: 150,
                                                        title: "Next",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text("List of Donation",textAlign: TextAlign.left,
                                    style: GoogleFonts.lato(
                                        color: primaryColor, fontWeight: FontWeight.w700, fontSize: 20)),
                              ),
                              Container(
                               height: MediaQuery.of(context).size.height,
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: FutureBuilder(
                                  future: donation.getData(),
                                  builder: (context, AsyncSnapshot<List<DonationModel>> snapshot){
                                    if(snapshot.hasData){
                                      return ListView.builder(
                                          itemCount: snapshot.data?.length,
                                          physics: AlwaysScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return DonationItem(
                                                icon: Icons.church,
                                                title: snapshot.data![index].donationName,
                                                amount: snapshot.data![index].amount.toString());
                                          });
                                    }else{
                                      return Text("No Data");
                                    }

                                  },

                                ),
                              ),

                            ],
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
        }));
  }

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  String removeJsonAndArray(String text) {
    if (text.startsWith('[') || text.startsWith('{')) {
      text = text.substring(1, text.length - 1);
      if (text.startsWith('[') || text.startsWith('{')) {
        text = removeJsonAndArray(text);
      }
    }
    return text;
  }

  DropdownMenuItem<Object> buildMenuItem(Object item) => DropdownMenuItem(
      value: item,
      child: Text(
        item.toString(),
        style: GoogleFonts.lato(fontSize: 17),
      ));
}
