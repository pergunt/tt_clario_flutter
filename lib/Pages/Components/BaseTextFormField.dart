import "package:flutter/material.dart";


class BaseTextFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String> validator;

  // Constructor
  BaseTextFormField({
    this.obscureText = false,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
    this.keyboardType,
  });

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }

        return validator(value);
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}