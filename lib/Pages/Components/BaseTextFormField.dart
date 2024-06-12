import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";


class BaseTextFormField extends StatefulWidget {
  final bool obscureText;
  final int? maxLength;
  final FocusNode focusNode;
  final String hintText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final bool? error;
  final FormFieldValidator<String>? validator;
  final List<Text>? customMessages;
  final Function(String value)? onChange;

  BaseTextFormField({
    required this.hintText,
    required this.focusNode,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.onChange,
    this.customMessages,
    this.error,
    this.maxLength
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  String? errorText;
  String inputValue = '';

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var success = errorText == null && widget.error != true;
    var focused = widget.focusNode.hasFocus;
    var color = colorScheme.primary;

    if (inputValue.isNotEmpty && !focused) {
      color = success ? Colors.green : Colors.red;
    }

    return TextFormField(
      maxLength: widget.maxLength,
      focusNode: widget.focusNode,
      style: TextStyle(color: color),
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        setState(() {
          errorText = null;
          inputValue = value;
        });

        if (widget.onChange != null) {
          widget.onChange!(value);
        }
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          setState(() {
            errorText = 'Required';
          });
        } else if (widget.validator != null) {
          setState(() {
            errorText = widget.validator!(value);
          });
        }

        return null;
      },
      decoration: InputDecoration(
        suffixIconColor: color,
        errorStyle: TextStyle(color: Colors.red),
        errorText: errorText,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding: EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20
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
            color: colorScheme.primary,
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
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: color,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}