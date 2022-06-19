import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/login/authwidget/LoginWidget.dart';
import 'package:gooliluck_customer_controller/login/authwidget/SignUpWidget.dart';
import 'package:gooliluck_customer_controller/utils.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isLogin = true;
  @override
  Widget build(BuildContext context) {
    return _isLogin ? LoginWidget(onClickedSignUp: toggle,)
        : SignUpWidget(onClickedSignIn: toggle);
  }
  void toggle() {
    logE('toggle');
    setState(()=> _isLogin = !_isLogin);
  }
}
