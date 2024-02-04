// first function is which platform i have

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// this function return ture if i on ios or mac
bool isApple() {
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;
}

// this function return ture if i android
bool isMobile() {
  return defaultTargetPlatform == TargetPlatform.android;
}

// function for error
void errorToast({required String? code, String? msg}) {
  Fluttertoast.showToast(
      msg: 'Error code: ${code} \n Error message|: ${msg}',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white.withOpacity(0.6),
      textColor: Colors.black,
      fontSize: 16.0);
}

// get language

// String getLangCode() {
//   try {
//     //window..locale.languageCode
//     switch (PlatformDispatcher.instance.locale.languageCode) {
//       case AppValues.langCodeUk:
//         return AppValues.langCodeUk;
//       case AppValues.langCodeEn:
//         return AppValues.langCodeEn;
//       default:
//         return AppValues.langCodeBasic;
//     }
//   } catch (e) {
//     return AppValues.langCodeBasic;
//   }
// }

Future<void> futureDelayed({int milleseconds = 2000}) async {
  await Future.delayed(Duration(milliseconds: milleseconds));
}
