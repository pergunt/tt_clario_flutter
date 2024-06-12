import "package:flutter/material.dart";
import 'package:tt_clario_flutter/Pages/Components/LoginInputEmail.dart';
import 'package:tt_clario_flutter/Pages/Components/LoginInputPassword.dart';
import 'package:tt_clario_flutter/Animations/FadeAnimation.dart';


class FormComponent extends StatefulWidget {
  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final focusState = {
    'email': false,
    'password': false,
  };

  @override
  void initState() {
    _emailFocusNode.addListener(() {
      _onFocusChange('email', _emailFocusNode.hasFocus);
    });

    _passwordFocusNode.addListener(() {
      _onFocusChange('password', _passwordFocusNode.hasFocus);
    });

    super.initState();
  }

  void _onFocusChange(String fieldName, bool hasFocus) {
    setState(() {
      focusState[fieldName] = hasFocus;
    });
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          FadeAnimation(
              delay: .6,
              beginTranslateY: -80,
              child: LoginInputEmail(_emailFocusNode)
          ),
          SizedBox(height: 20),
          FadeAnimation(
              delay: .7,
              beginTranslateY: 50,
              child: LoginInputPassword(_passwordFocusNode)
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: FadeAnimation(
              delay: .8,
              beginTranslateY: 50,
              child: ElevatedButton(
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
            ),
          )
        ],
      ),
    );
  }
}