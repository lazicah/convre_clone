import 'package:convre_clone/src/assets.dart';
import 'package:convre_clone/src/convre_app.dart';
import 'package:convre_clone/src/pages/register_page.dart';
import 'package:convre_clone/src/pages/reset_password_page.dart';
import 'package:convre_clone/src/widgets/buttons.dart';
import 'package:convre_clone/src/widgets/textfields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameEdit = TextEditingController();
  final _passwordEdit = TextEditingController();

  bool _buttonEnabled = true;

  List<TextEditingController> controllers = [];

  @override
  void didChangeDependencies() {
    controllers.clear();

    controllers.addAll([_usernameEdit, _passwordEdit]);

    controllers.forEach((controller) {
      controller.removeListener(_listener);
    });

    controllers.forEach((controller) {
      controller.addListener(_listener);
    });

    super.didChangeDependencies();
  }

  void _listener() {
    if (_usernameEdit.text.length > 4 && _passwordEdit.text.length > 6)
      setState(() {
        _buttonEnabled = true;
      });
    else
      setState(() {
        _buttonEnabled = false;
      });
  }

  @override
  void dispose() {
    controllers.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  Assets.convreLogo,
                  width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome to Convre, Africa's best. Your communities are waiting for you",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                SocialButton(
                  icon: Icon(MaterialCommunityIcons.google),
                  label: 'Continue with Google',
                ),
                SizedBox(
                  height: 16,
                ),
                SocialButton(
                  icon: Icon(MaterialCommunityIcons.facebook),
                  label: 'Continue with Facebook',
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: Divider()),
              Text('OR'),
              Expanded(child: Divider()),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  StyledTextField(
                    controller: _usernameEdit,
                    label: 'Email/Username',
                    validator: (s) {
                      if (s == null || s.length < 5) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StyledPasswordTextField(
                    controller: _passwordEdit,
                    label: 'password',
                    validator: (s) {
                      if (s == null || s.length < 6) {
                        return 'Required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text.rich(TextSpan(
                        text: 'Forgot Password?',
                        style: TextStyle(color: appColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('called');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ResetPasswordPage(),
                              ),
                            );
                          })),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ColoredButton(
                    label: 'Login',
                    onPressed: _buttonEnabled ? () {} : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(color: appColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    RegisterPage(),
                              ),
                            );
                          })
                  ])),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "About",
                            style: TextStyle(color: Colors.grey),
                            recognizer: TapGestureRecognizer()..onTap = () {}),
                        TextSpan(text: " | "),
                        TextSpan(
                            text: 'Terms of Use',
                            style: TextStyle(color: Colors.grey),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
