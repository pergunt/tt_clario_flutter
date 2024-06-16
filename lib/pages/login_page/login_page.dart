import 'package:flutter/material.dart';
import 'components/index.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key,});

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
                    Color(0xFFE0EDFB),
                  ]
              )
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
          // if orientation is landscape
          child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Sign up',
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
                  )
                )
              ],
            )
        ),
      ),
    );
  }
}