
import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/utils.dart';
import 'package:gooliluck_customer_controller/widgets/GLEmail.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _fromKey = GlobalKey<FormState>();
  String _email = '';
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
                  buildSubmitButton(),
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
              logW('email is $_email');

              // Navigator.of(context).pushNamed(OrderList.route);
            }
          } else {
            logE('currentState is null');
          }
        },
        child: const Text('Reset Password'));
  }
}