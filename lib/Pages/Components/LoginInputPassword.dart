import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/BaseTextFormField.dart';

class LoginInputPassword extends StatefulWidget {
  final FocusNode focusNode;
  LoginInputPassword(this.focusNode);

  @override
  State<LoginInputPassword> createState() => _LoginInputPassword();
}

class _LoginInputPassword extends State<LoginInputPassword> {

  var obscureText = true;
  var password = ValueNotifier('');

  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: password,
        builder: (context, value, _) {
          var minValueError = value.length < 8;
          var casingError = !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])\S').hasMatch(value);
          var digitError = !RegExp(r'[0-9]').hasMatch(value);
          var customMessages = [
            (
              type: 'min',
              message: '8 characters or more (no spaces)',
              error: minValueError
            ),
            (
              type: 'casing',
              message: 'Uppercase and lowercase letters',
              error: casingError
            ),
            (
              type: 'digit',
              message: 'At least one digit',
              error: digitError
            )
          ];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseTextFormField(
                focusNode: widget.focusNode,
                error: minValueError || casingError || digitError,
                hintText: 'Password',
                obscureText: obscureText,
                onChange: (value) {
                  password.value = value;
                },
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
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: customMessages.map((item) {
                    bool hasError = item.error;
                    Color textColor = value.isEmpty ? Colors.black : (hasError ? Colors.red : Colors.green);

                    return Text(
                      item.message,
                      style: TextStyle(color: textColor),
                    );
                  }).toList(),
                ),
              )
            ],
          );
        }
    );
  }
}
