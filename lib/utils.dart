


import 'package:logger/logger.dart';

void logE(String message){
  var logger = Logger();
  logger.e(message);
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