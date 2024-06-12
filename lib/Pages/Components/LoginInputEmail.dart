import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/BaseTextFormField.dart';
import 'package:email_validator/email_validator.dart';

class LoginInputEmail extends StatelessWidget {
  final FocusNode focusNode;

  LoginInputEmail(this.focusNode);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      focusNode: focusNode,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        final valid = EmailValidator.validate(value!);

        if (!valid) {
          return 'Invalid Email';
        }

        return null;
      }
    );
  }
}