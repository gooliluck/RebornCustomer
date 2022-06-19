

import 'package:flutter/material.dart';
bool visible = false;
TextFormField buildTextFormFieldForPassword(
    void Function(String?) passwordSavedCallback,bool visible,{required IconButton visibleIcon,bool lastField = false}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      icon: const Icon(Icons.password),
      hintText: '你的密碼',
      labelText: '密碼 *',
      suffixIcon: visibleIcon,
    ),
    textInputAction: lastField ? TextInputAction.done : TextInputAction.next,
    obscureText: !visible,
    enableSuggestions: false,
    autocorrect: false,
    onSaved: (String? value) {
      passwordSavedCallback(value);
    },
    validator: (String? value) {
      return (value != null && value.length < 6)
          ? '密碼不能為空 LESS THEN 6 CHAR'
          : null;
    },
  );
}
