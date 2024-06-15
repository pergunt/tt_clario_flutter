import "package:flutter/material.dart";
import 'package:tt_clario_flutter/components/index.dart';
import 'package:email_validator/email_validator.dart';

class LoginInputEmail extends StatefulWidget {
  @override
  State<LoginInputEmail> createState() => _LoginInputEmailState();
}

class _LoginInputEmailState extends State<LoginInputEmail> {
  String inputValue = '';
  Color? color;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BaseTextFormField(
      hintText: 'Email',
      inputValue: inputValue,
      color: color ?? colorScheme.primary,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          inputValue = value;
          color = null;  // Reset color when input changes
        });
      },
      validator: (value) {
        if (!EmailValidator.validate(value)) {
          setState(() {
            color = Colors.red;
          });

          return 'Invalid Email';
        } else {
          setState(() {
            color = Colors.green;
          });

          return null;
        }
      },
    );
  }
}