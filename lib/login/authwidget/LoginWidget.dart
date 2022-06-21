import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gooliluck_customer_controller/pages/OrderList.dart';
import 'package:gooliluck_customer_controller/utils/Utils.dart';
import 'package:gooliluck_customer_controller/widgets/GLEmail.dart';
import 'package:gooliluck_customer_controller/widgets/GLPassword.dart';
import '../../utils.dart';

class LoginWidget extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const LoginWidget({Key? key, required this.onClickedSignUp})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _fromKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (buildContext) {
        return Scaffold(
            body: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _fromKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      const SizedBox(
                        height: 24,
                      ),
                      _forgetPasswordRow(),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  Widget _forgetPasswordRow() {
    return Center(
      child: RichText(
          text: TextSpan(
              style: const TextStyle(color: Colors.black, fontSize: 16),
              text: 'No Account?   ',
              children: [
            TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = widget.onClickedSignUp,
                text: 'Sign up',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.secondary))
          ])),
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
              signIn();
            }
          } else {
            logE('currentState is null');
          }
        },
        child: const Text('Login'));
  }
  Future signIn() async {
    showDialog(context: context, barrierDismissible: false,builder: (context) => const Center(child: CircularProgressIndicator(),));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.trim(), password: _password.trim());
      var userId = FirebaseAuth.instance.currentUser?.uid;
      logI('user uid is $userId');
      if(userId != null ){
        saveStringToSharePreference("userId", 'nGufiqoobGXu7cnJiZUfudZHSR42');
        Navigator.of(context).pushNamed(OrderList.route);
      }
    } on FirebaseAuthException catch (e) {
      logE(e.toString());
      Utils.showSnackBar(e.toString());
      Navigator.of(context).pop();
    }
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
