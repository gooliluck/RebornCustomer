

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/pages/OrderList.dart';
import 'package:gooliluck_customer_controller/widgets/GLEmail.dart';
import 'package:gooliluck_customer_controller/widgets/GLPassword.dart';
import '../../utils.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const SignUpWidget({Key? key,required this.onClickedSignIn}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignUpWidgetState();

}

class _SignUpWidgetState extends State<SignUpWidget> {

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
                  buildSubmitButton(),
                  SizedBox(height: 24,),
                  _forgetPasswordRow(),
                ],
              ),
            ));
      },
    );
  }
  Widget _forgetPasswordRow(){
    return Center(
      child: RichText(text: TextSpan(
          style: const TextStyle(color: Colors.black,fontSize: 16),
          text: 'Already have an account?   ',
          children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignIn,
                text: 'Log in',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.secondary
                )
            )
          ]
      )),
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
              signUp();
              // Navigator.of(context).pushNamed(OrderList.route);
            }
          } else {
            logE('currentState is null');
          }
        },
        child: const Text('SignUp'));
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
  Future signUp() async {
    showDialog(context: context, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.trim(), password: _password.trim());
    } on FirebaseAuthException catch (e) {
      logE(e.toString());
    }
  }
}