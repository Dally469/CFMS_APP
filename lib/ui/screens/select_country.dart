import 'package:cfms/ui/screens/dashboard.dart';
import 'package:cfms/ui/screens/select_church.dart';
import 'package:cfms/ui/widgets/buttons/loading_button.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:cfms/utils/colors.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_cupertino.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/buttons/state_button.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  Country _selectedDialogCountry =
      CountryPickerUtils.getCountryByPhoneCode('250');

  TextEditingController textController = TextEditingController();
  RegExp digitValidator = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  bool isANumber = true;
  bool isClicked = false;
  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
          Heading(title: "Country", subtitle: "Choose region where you live"),
          Form(
            key: formGlobalKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Text("Select country"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: primaryOverlayColor),
                            borderRadius: BorderRadius.circular(4)),
                        child: ListTile(
                          onTap: _openCountryPickerDialog,
                          title: _buildDialogItem(_selectedDialogCountry),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: textController,
                          onChanged: (inputValue) {
                            if (inputValue.isEmpty ||
                                digitValidator.hasMatch(inputValue)) {
                              setValidator(true);
                            } else {
                              setValidator(false);
                            }
                          },
                          decoration: InputDecoration(
                            errorText: isANumber ? null : "Please enter a number",
                            hintText: 'Phone number',
                            border: OutlineInputBorder(),

                            suffixIcon: isANumber || textController.text.isEmpty
                                ? Icon(
                                    Icons.check_circle,
                                    color: greenColor,
                                  )
                                : Icon(
                                    Icons.error,
                                    color: redColor,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    isClicked = false;
                    if(formGlobalKey.currentState!.validate()){
                      if(!isANumber || textController.text.isEmpty ){
                        final snackBarError = SnackBar(
                            content: Row(
                              children: [
                                Icon(
                                  Icons.error_outline,
                                  color: whiteColor,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Please enter valid phone number",
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      color: whiteColor),
                                ),
                              ],
                            ));
                        _scaffoldKey.currentState!
                            .showSnackBar(snackBarError);
                      }else{
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Dashboard()));
                      }
                    }


                  },
                  child: LoadingButton(
                    icon: Icons.arrow_forward,
                    backgroundColor: primaryColor,
                    width: 200,
                    title: "Continue",
                    isLoading: isClicked,
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
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

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.pink),
          child: CountryPickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...',  border: OutlineInputBorder(),),
            isSearchable: true,
            title: Text('Select your phone code'),
            onValuePicked: (Country country) =>
                setState(() => _selectedDialogCountry = country),
            itemBuilder: _buildDialogItem,
            priorityList: [
              CountryPickerUtils.getCountryByIsoCode('TR'),
              CountryPickerUtils.getCountryByIsoCode('US'),
            ],
          ),
        ),
      );
}
