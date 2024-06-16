import 'package:flutter/material.dart';
import 'package:tt_clario_flutter/components/index.dart';
import 'package:email_validator/email_validator.dart';

class InputEmail extends StatefulWidget {
  InputEmail({super.key,});

  @override
  State<InputEmail> createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  Color? color;

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      hintText: 'Email',
      color: color,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (color != null) {
          setState(() {
            color = null;  // Reset color when input changes
          });
        }
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