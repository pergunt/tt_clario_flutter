import "package:flutter/material.dart";


class BaseTextFormField extends StatefulWidget {
  final bool obscureText;
  final int? maxLength;
  final String hintText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final Widget? error;
  final Color color;
  final String inputValue;
  final List<Text>? customMessages;
  final Function(String value)? validator;
  final Function(String value) onChanged;

  BaseTextFormField({
    required this.hintText,
    required this.onChanged,
    required this.inputValue,
    required this.color,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.customMessages,
    this.error,
    this.maxLength
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  Widget? required;

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var errors = [required, widget.error]
        .where((item) => item != null)
        .map((widget) => widget!)
        .toList();
    var dynamicColor = required != null ? Colors.red : widget.color;

    return TextFormField(
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      onChanged: (value) {
        widget.onChanged(value);

        if (required != null) {
          setState(() {
            required = null;
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          setState(() {
            required = Text('Required', style: TextStyle(color: Colors.red),);
          });

        } else if (widget.validator != null) {
          widget.validator!(value);
        }

        return null;
      },
      style: TextStyle(color: dynamicColor),
      decoration: InputDecoration(
        error: errors.isNotEmpty
          ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: errors as List<Widget>,
        )
          : null,
        errorStyle: TextStyle(color: Colors.red),
        hintText: widget.hintText,
        suffixIconColor: dynamicColor,
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
            color: dynamicColor,
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
            color: dynamicColor,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}