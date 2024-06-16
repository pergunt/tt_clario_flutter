import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function() onPressed;

  SubmitButton({
    super.key,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero), // Remove padding to make Container fill the button
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF70C3FF),
                  Color(0xFF4B65FF)
                ],
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            padding: EdgeInsets.symmetric(vertical: 12),
            alignment: Alignment.center,
            child: Text(
              'Submit',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        )
    );
  }
}