import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/BaseTextFormField.dart';
import 'package:email_validator/email_validator.dart';

class LoginInputEmail extends StatelessWidget {

  Widget build(BuildContext context) {

    return BaseTextFormField(
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        final valid = EmailValidator.validate(value!);

        if (!valid) {
          return 'Invalid';
        }

        return null;
      }
    );
  }
}