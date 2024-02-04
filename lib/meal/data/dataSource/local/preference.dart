import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class Preferences {
  // we will user as local database hive livbary
  /** first thing you must give a name for database or boz */
  static const String _preferenceBox = '_preference';
  //2- open the box so i need to create the box
  Box<dynamic>? _box;

  // i made function to open the box
  Future<void> openBox() async {
    _box = await Hive.openBox(_preferenceBox);
  }

  Future<void> clearBox() async {
    await _box!.clear();
  }
}
