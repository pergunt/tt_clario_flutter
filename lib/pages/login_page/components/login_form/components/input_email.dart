import 'package:flutter/material.dart';
import 'package:tt_clario_flutter/components/index.dart';
import 'package:email_validator/email_validator.dart';

class InputEmail extends StatefulWidget {
  InputEmail({super.key,});

  @override
  State<InputEmail> createState() => InputEmailState();
}

class InputEmailState extends State<InputEmail> {
  Color? color;
  String inputValue = '';

  validate(String? value) {
    if (!EmailValidator.validate(value?? inputValue)) {
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
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      hintText: 'Email',
      color: color,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        setState(() {
          inputValue = value;
          color = null;  // Reset color when input changes
        });
      },
      validator: (value) {
        return validate(value);
      },
    );
  }
}