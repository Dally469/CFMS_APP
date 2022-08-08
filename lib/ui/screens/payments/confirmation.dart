import 'package:cfms/ui/screens/approved_payment.dart';
import 'package:cfms/ui/widgets/buttons/button.dart';
import 'package:cfms/ui/widgets/buttons/loading_button.dart';
import 'package:cfms/ui/widgets/buttons/state_button.dart';
import 'package:cfms/ui/widgets/texts/heading.dart';
import 'package:cfms/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmPayment extends StatefulWidget {
  final int methodId;
  final double totalAmount;
  const ConfirmPayment({Key? key, required this.methodId, required this.totalAmount}) : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();
  RegExp digitValidator = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  bool isANumber = true;
  bool isClicked = false;

  int id = 0;
  int mId = 1;
  String title = '';

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.methodId == 1){
      title = "Mobile Money";
    }else if(widget.methodId == 2){
      title = "Credit Card ";
    }else if(widget.methodId == 3){
      title = "Bank Teller";
    }else{
      title = "Other number";
    }
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
            child: Text(" ",
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
                    Icons.swap_horiz_rounded,
                    color: primaryColor,
                  )),
            ),
          ],
        ),
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Heading(
                    title: title + " payment",
                    subtitle: "Thanks you to choose credit card"),
                SizedBox(
                  height: 20,
                ),
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
                Visibility(
                  visible: widget.methodId == 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        CreditCardWidget(
                          glassmorphismConfig: useGlassMorphism
                              ? Glassmorphism.defaultConfig()
                              : null,
                          cardNumber: cardNumber,
                          expiryDate: expiryDate,
                          cardHolderName: cardHolderName,
                          cvvCode: cvvCode,
                          showBackView: isCvvFocused,
                          obscureCardNumber: true,
                          obscureCardCvv: true,
                          isHolderNameVisible: true,
                          cardBgColor: primaryColor,
                          backgroundImage: 'assets/images/icons/card_bg.png',
                          isSwipeGestureEnabled: true,
                          onCreditCardWidgetChange:
                              (CreditCardBrand creditCardBrand) {},
                          customCardTypeIcons: <CustomCardTypeIcon>[
                            CustomCardTypeIcon(
                              cardType: CardType.mastercard,
                              cardImage: Image.asset(
                                'assets/images/icons/mastercard.png',
                                height: 48,
                                width: 48,
                              ),
                            ),
                            CustomCardTypeIcon(
                              cardType: CardType.americanExpress,
                              cardImage: Image.asset(
                                'assets/images/icons/amex.png',
                                height: 48,
                                width: 48,
                              ),
                            ),
                          ],
                        ),
                        CreditCardForm(
                          formKey: formKey,
                          obscureCvv: true,
                          obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: primaryColor,
                          cardNumberDecoration: InputDecoration(
                              labelText: 'Number',
                              hintText: 'XXXX XXXX XXXX XXXX',
                              hintStyle: const TextStyle(color: blackColor),
                              labelStyle: const TextStyle(color: blackColor),
                              focusedBorder: border,
                              enabledBorder: border,
                              border: border,

                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: blackColor),
                            labelStyle: const TextStyle(color: blackColor),
                            focusedBorder: border,
                            enabledBorder: border,
                            border: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: blackColor),
                            labelStyle: const TextStyle(color: blackColor),
                            focusedBorder: border,
                            enabledBorder: border,
                            border: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: blackColor),
                            labelStyle: const TextStyle(color: blackColor),
                            focusedBorder: border,
                            enabledBorder: border,
                            border: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              print('valid!');
                              Navigator.push( context, MaterialPageRoute(builder: (context) => ApprovalPayment(method: id, totalAmount: widget.totalAmount,)));

                            } else {
                              print('invalid!');
                            }
                          },
                          child: ActiveButton(
                              icon: Icons.check,
                              backgroundColor: primaryColor,
                              width: 250,
                              title: "Confirm",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.methodId == 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(

                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 1, color : mId == 1 ? greenColor : whiteColor),
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
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "My Current  number",
                                      style: GoogleFonts.lato(
                                          color: blackColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  ),
                                  mId == 1
                                      ? Container(
                                    height: 30,
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 14,
                                        color: whiteColor,
                                      ),
                                    ),
                                  )
                                      : Container(

                                    child: Radio(
                                      value: 1,
                                      groupValue: mId,
                                      activeColor: greenColor,
                                      onChanged: (val) {
                                        setState(() {
                                          mId = 1;
                                          print("English selected");
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "(+250) 789-000-000",
                                  style: GoogleFonts.lato(
                                      color: blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            border: Border.all(width: 1, color : mId == 2 ? greenColor : whiteColor),
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
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      "Other",
                                      style: GoogleFonts.lato(
                                          color: blackColor,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14),
                                    ),
                                  ),
                                  mId == 2
                                      ? Container(
                                    height: 30,
                                    margin: EdgeInsets.symmetric(horizontal: 15),
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: greenColor),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 14,
                                        color: whiteColor,
                                      ),
                                    ),
                                  )
                                      : Container(

                                    child: Radio(
                                      value: 2,
                                      groupValue: mId,
                                      activeColor: greenColor,
                                      onChanged: (val) {
                                        setState(() {
                                          mId = 2;

                                          print("English selected");
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Other phone number",
                                  style: GoogleFonts.lato(
                                      color: blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),



                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if(mId == 1){
                              widget.methodId == 1;
                              Navigator.push( context, MaterialPageRoute(builder: (context) => ApprovalPayment(method: id, totalAmount: widget.totalAmount,)));
                            }else{
                              Navigator.push( context, MaterialPageRoute(builder: (context) => ConfirmPayment(methodId: 4, totalAmount: widget.totalAmount,)));
                            }
                          },
                          child: ActiveButton(
                              icon: Icons.check,
                              backgroundColor: primaryColor,
                              width: 250,
                              title: "Confirm"),
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.methodId == 4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.all(10),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/logo/mtn.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "MTN",
                                          style: GoogleFonts.lato(
                                              color: blackColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                    id == 1
                                        ? Container(
                                      height: 30,
                                      margin: EdgeInsets.symmetric(horizontal: 15),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greenColor),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: whiteColor,
                                        ),
                                      ),
                                    )
                                        : Container(

                                      child: Radio(
                                        value: 1,
                                        groupValue: id,
                                        activeColor: greenColor,
                                        onChanged: (val) {
                                          setState(() {
                                            id = 1;
                                            print("English selected");
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex:1,
                              child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                margin: EdgeInsets.all(10),
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/logo/airtel.png",
                                          height: 25,
                                          width: 25,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Airtel",
                                          style: GoogleFonts.lato(
                                              color: blackColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17),
                                        )
                                      ],
                                    ),
                                    id == 2
                                        ? Container(
                                      height: 30,
                                      margin: EdgeInsets.symmetric(horizontal: 15),
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: greenColor),
                                      child: Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: whiteColor,
                                        ),
                                      ),
                                    )
                                        : Container(

                                      child: Radio(
                                        value: 2,
                                        groupValue: id,
                                        activeColor: greenColor,
                                        onChanged: (val) {
                                          setState(() {
                                            id = 2;
                                            print("Aitel selected");
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 9),
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
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {

                            if(id == 1){
                              if (isANumber) {
                                print('mtn valid!');
                                Navigator.push( context, MaterialPageRoute(builder: (context) => ApprovalPayment(method: id, totalAmount: widget.totalAmount,)));

                              } else {
                                print('mtn invalid!');
                              }
                            }else{
                              if (isANumber) {
                                print('airtel valid!');
                                Navigator.push( context, MaterialPageRoute(builder: (context) => ApprovalPayment(method: id, totalAmount: widget.totalAmount,)));

                              } else {
                                print('airtel invalid!');
                              }
                            }

                            Navigator.push( context, MaterialPageRoute(builder: (context) => ApprovalPayment(method: id, totalAmount: widget.totalAmount,)));

                          },
                          child: ActiveButton(
                              icon: Icons.check,
                              backgroundColor: primaryColor,
                              width: 250,
                              title: "Confirm"),
                        )
                      ],
                    ),
                  ),
                ),
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
      ),);
  }
  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }
  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
