import "package:flutter/material.dart";
import 'components/index.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                  colors: [
                    Color(0xFFF4F9FF),
                    Color(0xFFFE0EDFB),
                  ]
              )
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: colorScheme.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ),
                SizedBox(height: 20,),
                Expanded(
                    flex: 2,
                    child: LoginForm()
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}