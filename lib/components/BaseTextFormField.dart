import "package:flutter/material.dart";


class BaseTextFormField extends StatefulWidget {
  final bool obscureText;
  final int? maxLength;
  final String hintText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final Color color;
  final String inputValue;
  final List<Map<String, dynamic>>? customMessages;
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
    this.maxLength
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  String? requiredMessage;
  String? errorMessage;

  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var dynamicColor = requiredMessage != null || errorMessage != null ? Colors.red : widget.color;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLength: widget.maxLength,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          onChanged: (value) {
            widget.onChanged(value);

            if (requiredMessage != null || errorMessage != null) {
              setState(() {
                requiredMessage = null;
                errorMessage = null;
              });
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              setState(() {
                requiredMessage = 'Required';
              });
            } else if (widget.validator != null) {
              final error = widget.validator!(value);

              setState(() {
                errorMessage = error;
              });
            }

            return null;
          },
          style: TextStyle(color: dynamicColor),
          decoration: InputDecoration(
            errorText: requiredMessage ?? errorMessage,
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
        ),
        if (widget.customMessages != null)
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.customMessages!.map((item) {
                final hasError = item['error'];
                final message = item['message'] as String;

                return Text(
                  message,
                  style: TextStyle(
                      color: widget.inputValue.isNotEmpty ? (hasError ? Colors.red : Colors.green) : colorScheme.primary
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}