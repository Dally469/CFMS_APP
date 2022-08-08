import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cfms/services/db/db_helper.dart';

import '../../models/donations/donation.dart';

class DonationProvider with ChangeNotifier {
  DbHelper db = DbHelper();
  int _counter = 0;
  int get counter => _counter;

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;

  late Future<List<DonationModel>> _donation;
  Future<List<DonationModel>> get donation => _donation;

  Future<List<DonationModel>> getData() async {
    _donation = db.getDonationList();

    return _donation;
  }

  void _setPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('donation_items', _counter);
    pref.setDouble('total_amount', _totalAmount);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('donation_items') ?? 0;
    _totalAmount = pref.getDouble('total_amount') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  void removeAllCounter() {
    _counter  = 0;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  void addTotalAmount(double totalAmount) {
    _totalAmount = _totalAmount + totalAmount;
    _setPrefItems();
    notifyListeners();
  }

  void removeTotalAmount(double totalAmount) {
    _totalAmount = _totalAmount - totalAmount;
    _setPrefItems();
    notifyListeners();
  }

  void resetTotalAmount() {
    _totalAmount = 0.0;
    _setPrefItems();
    notifyListeners();
  }

  double getTotalAmount() {
    _getPrefItems();
    return _totalAmount;
  }
}
