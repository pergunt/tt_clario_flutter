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
      'min': value.length < 8,
      'charCasing': !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])\S').hasMatch(value),
      'digit': !RegExp(r'[0-9]').hasMatch(value)
    };
  }

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    var errors = customMessages
        .where((item) => item['error'] == true)
        .toList();
    var messages = customMessages
        .where((item) => item['error'] == false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseTextFormField(
          maxLength: 64,
          color: color ?? colorScheme.primary,
          inputValue: inputValue,
          error: errors.isEmpty
              ? null
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: errors.map((item) {
                  return Text(
                    item['message'] as String,
                    style: TextStyle(color: Colors.red),
                  );
              }).toList()
          ),
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
        ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: messages.map((item) => Text(
                  item['message'] as String,
                style: TextStyle(
                  color: inputValue.isNotEmpty ? Colors.green : colorScheme.primary
                ),
              )).toList(),
            ),
          )
      ],
    );
  }
}
