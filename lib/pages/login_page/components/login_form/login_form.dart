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
          FadeAnimation(delay: 2, child: InputEmail()),
          SizedBox(height: 20),
          FadeAnimation(delay: 3, child: InputPassword(),),
          SizedBox(height: 20),
          FadeAnimation(delay: 4, child: SubmitButton(formKey: _formKey,))
        ],
      ),
    );
  }
}