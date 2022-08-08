import 'package:cfms/models/donations/donation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
  }

  initDatabase() async {
    io.Directory documentDirectoty = await getApplicationDocumentsDirectory();

    String path = join(documentDirectoty.path, 'donations.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE donation (id INTEGER PRIMARY KEY, donationId VARCHAR UNIQUE, donationName VARCHAR, amount INTEGER)');
  }

  Future<DonationModel> insert(DonationModel donationModel) async {
    var dbMember = await db;
    await dbMember!.insert('donation', donationModel.toJson());
    return donationModel;
  }

  Future<int> delete(int id) async {
    var dbMember = await db;
    return await dbMember!.delete('donation', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    var dbMember = await db;
    return await dbMember!.delete('donation');
  }

  Future<List<DonationModel>> getDonationList() async {
    var dbMember = await db;
    final List<Map<String, Object?>> queryResult =
        await dbMember!.query('donation');
    return queryResult.map((e) => DonationModel.fromJson(e)).toList();
  }
}
