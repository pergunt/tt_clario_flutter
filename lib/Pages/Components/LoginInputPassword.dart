import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/BaseTextFormField.dart';

class LoginInputPassword extends StatefulWidget {

  @override
  State<LoginInputPassword> createState() => _LoginInputPassword();
}

class _LoginInputPassword extends State<LoginInputPassword> {
  var obscureText = true;

  Widget build(BuildContext context) {

    return BaseTextFormField(
      hintText: 'Password',
      obscureText: obscureText,
      suffixIcon: IconButton(
        icon: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'TODO';
        }

        return null;
      },
    );

  }
}