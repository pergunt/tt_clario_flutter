import 'package:flutter/material.dart';
import 'components/index.dart';
import 'package:tt_clario_flutter/Animations/fade_animation.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key,});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<InputEmailState> _inputEmailKey = GlobalKey<InputEmailState>();
  final GlobalKey<InputPasswordState> _inputPasswordKey = GlobalKey<InputPasswordState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          FadeAnimation(
            delay: 0.1,
            child: InputEmail(key: _inputEmailKey),
            getOffset: (value) => Offset(-value, 0)
          ),
          SizedBox(height: 20),
          FadeAnimation(
            delay: 4,
            child: InputPassword(key: _inputPasswordKey,),
            getOffset: (value) => Offset(value, 0)
          ),
          SizedBox(height: 20),
          FadeAnimation(
              delay: 8,
              child: SubmitButton(
                onPressed: () {
                  _formKey.currentState!.validate();

                  String? emailResult = _inputEmailKey.currentState!.validate(null);
                  ValidationResult passwordResult = _inputPasswordKey.currentState!.validate(null);

                  if (emailResult == null && !passwordResult.hasError) {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Center(
                            child: Text('Success'),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              getOffset: (value) => Offset(0, value)
          )
        ],
      ),
    );
  }
}