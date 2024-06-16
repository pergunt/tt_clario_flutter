import "package:flutter/material.dart";
import 'package:tt_clario_flutter/components/index.dart';

class LoginInputPassword extends StatefulWidget {
  @override
  State<LoginInputPassword> createState() => _LoginInputPassword();
}

class _LoginInputPassword extends State<LoginInputPassword> {
  bool obscureText = true;
  String inputValue = '';
  Color? color;

  var customMessages = [
    {
      'type': "min",
      'message': '8 characters or more (no spaces)',
      'error': false
    },
    {
      'type': "charCasing",
      'message': 'Uppercase and lowercase letters',
      'error': false
    },
    {
      'type': "digit",
      'message': 'At least one digit',
      'error': false
    },
  ];

  getValidationMap (String value) {
    return {
      'min': value.trim().replaceAll(RegExp(r'\s'), '').length < 8,
      'charCasing': !RegExp(r'(?=.*[a-z])(?=.*[A-Z])').hasMatch(value),
      'digit': !RegExp(r'[0-9]').hasMatch(value)
    };
  }

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BaseTextFormField(
      maxLength: 64,
      color: color ?? colorScheme.primary,
      hintText: 'Password',
      obscureText: obscureText,
      onChanged: (value) {
        var validationMap = getValidationMap(value);
        var hasError = validationMap.values.any((item) => item == true);

        setState(() {
          inputValue = value;
          color = value.isEmpty
              ? null
            : (hasError ? Colors.red : Colors.green);
          customMessages = customMessages.map((item) {
            return {
              ...item,
              'error': value.isNotEmpty && validationMap[item['type']] == true,
            };
          }).toList();
        });
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
      customError: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: customMessages.map((item) {
          final hasError = item['error'] as bool;
          final message = item['message'] as String;

          return Text(
            message,
            style: TextStyle(
                color: inputValue.isNotEmpty ? (hasError ? Colors.red : Colors.green) : colorScheme.primary
            ),
          );
        }).toList(),
      )
    );
  }
}
