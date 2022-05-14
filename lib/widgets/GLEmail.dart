import 'package:flutter/material.dart';

TextFormField buildTextFormFieldForEmail(
    void Function(String?) emailSavedCallback,{bool lastField = false}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: const InputDecoration(
      icon: Icon(Icons.email),
      hintText: '你的 Email?',
      labelText: 'Email *',
    ),
    textInputAction: lastField ? TextInputAction.done : TextInputAction.next,
    onSaved: (String? value) {
      emailSavedCallback(value);
    },
    validator: (String? value) {
      return (value != null && !value.contains('@') && value.isNotEmpty)
          ? '這個不是Email'
          : null;
    },
  );
}
