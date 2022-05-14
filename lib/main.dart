import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/login/LoginPage.dart';
import 'package:gooliluck_customer_controller/pages/OrderList.dart';
import 'package:gooliluck_customer_controller/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    logE('message');
    return MaterialApp(
      title: 'Gooliluck Customer Controller',
      initialRoute: LoginPage.route,
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