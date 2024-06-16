import 'package:flutter/material.dart';
import 'components/index.dart';
import 'package:tt_clario_flutter/Animations/fade_animation.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key,});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          FadeAnimation(delay: 2, child: LoginInputEmail()),
          SizedBox(height: 20),
          FadeAnimation(delay: 3, child: LoginInputPassword(),),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
            child: FadeAnimation(delay: 5, child: ElevatedButton(
                style: ButtonStyle(
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero), // Remove padding to make Container fill the button
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                onPressed: () {
                  _formKey.currentState!.validate();
                },
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
              ),
            )
          )
        ],
      ),
    );
  }
}