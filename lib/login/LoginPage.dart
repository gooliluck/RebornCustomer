import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/pages/OrderList.dart';
import 'package:gooliluck_customer_controller/utils.dart';
import 'package:gooliluck_customer_controller/widgets/GLEmail.dart';
import 'package:gooliluck_customer_controller/widgets/GLPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final _fromKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (buildContext) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('title'),
              leading: const Text('leading'),
            ),
            body: Form(
              key: _fromKey,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  buildTextFormFieldForEmail((changedValue) {
                    _email = changedValue ?? '';
                  }),
                  buildTextFormFieldForPassword((changedValue) {
                    _password = changedValue ?? '';
                  }, _passwordVisible,
                      visibleIcon: buildVisibleIconButton(), lastField: true),
                  const SizedBox(
                    height: 15,
                  ),
                  buildSubmitButton()
                ],
              ),
            ));
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
        onPressed: () {
          if (_fromKey.currentState != null) {
            final formState = _fromKey.currentState!;
            if (formState.validate()) {
              formState.save();
              logW('email is $_email\npassword is $_password');
              Navigator.of(context).pushNamed(OrderList.route);
            }
          } else {
            logE('currentState is null');
          }
        },
        child: const Text('Submit'));
  }

  IconButton buildVisibleIconButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
        icon: Icon(
          // Based on passwordVisible state choose the icon
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
          color: Theme.of(context).primaryColorDark,
        ));
  }
}
