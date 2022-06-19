


import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void logE(String message){
  var logger = Logger();
  logger.e(message);
}
Future<String> getStringFromSharePreference(String key) async {
  try{
    var sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.getString(key);
    if(value == null){
      return "";
    } else {
      return value;
    }
  } catch (e){
    return "";
  }
}
AppLocalizations getString(BuildContext context) {
  return AppLocalizations.of(context)!;
}

void logD(String message){
  var logger = Logger();
  logger.d(message);
}
void logI(String message){
  var logger = Logger(printer: PrettyPrinter(
      methodCount: 0,printTime: true
  ));
  logger.i(message);
}
void logW(String message){
  var logger = Logger();
  logger.w(message);
}