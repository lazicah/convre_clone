import 'package:convre_clone/src/pages/new_password_page.dart';
import 'package:convre_clone/src/widgets/buttons.dart';
import 'package:convre_clone/src/widgets/textfields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Reset Password',
                style: theme.textTheme.headline5,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your username or email and we'll send you a link to get back into your account.",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              StyledTextField(label: 'Email/Username'),
              SizedBox(
                height: 20,
              ),
              ColoredButton(
                label: 'Submit',
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              Text.rich(
                TextSpan(
                    text: "Have code?",
                    style: TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                NewPasswordPage(),
                          ),
                        );
                      }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
