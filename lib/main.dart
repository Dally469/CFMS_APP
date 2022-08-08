import 'package:cfms/ui/screens/new_donation.dart';
import 'package:cfms/ui/screens/payments/confirmation.dart';
import 'package:cfms/ui/screens/select_payment.dart';
import 'package:cfms/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CFMS',
      theme: ThemeData(),
      home: const NewDonation(),
    );
  }
}

