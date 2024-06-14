import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/BaseTextFormField.dart';
import 'package:email_validator/email_validator.dart';

class LoginInputEmail extends StatefulWidget {
  @override
  State<LoginInputEmail> createState() => _LoginInputEmailState();
}

class _LoginInputEmailState extends State<LoginInputEmail> {
  Widget? error;
  String inputValue = '';
  Color? color;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BaseTextFormField(
      hintText: 'Email',
      error: error,
      inputValue: inputValue,
      color: color ?? colorScheme.primary,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          color = null;
          error = null;
          inputValue = value;
        });
      },
      validator: (value) {
        Text? newError;

        if (!EmailValidator.validate(value)) {
          newError = Text('Invalid Email', style: TextStyle(color: Colors.red),);
        } else {
          newError = null;
        }

        setState(() {
          error = newError;
          color = newError != null ? Colors.red : Colors.green;
        });

        return null;
      },
    );
  }
}