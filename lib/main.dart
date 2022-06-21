import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/login/LoginPage.dart';
import 'package:gooliluck_customer_controller/pages/OrderList.dart';
import 'package:gooliluck_customer_controller/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gooliluck_customer_controller/utils/Utils.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  late Locale _locale;
  double d=0;
  @override
  Widget build(BuildContext context) {
    logE('message');
    return MaterialApp(
      title: 'Gooliluck Customer Controller',
      initialRoute: LoginPage.route,
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      scaffoldMessengerKey: Utils.messengerKey,
      routes: {
        LoginPage.route :(context) => const LoginPage(),
        OrderList.route : (context) => const OrderList()
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }

}