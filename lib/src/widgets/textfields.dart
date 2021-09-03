import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;

  const StyledTextField({
    Key? key,
    this.controller,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration:
          InputDecoration(hintText: label, border: OutlineInputBorder()),
    );
  }
}

class StyledPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String label;
  final String? Function(String?)? validator;

  const StyledPasswordTextField({
    Key? key,
    this.controller,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  _StyledPasswordTextFieldState createState() =>
      _StyledPasswordTextFieldState();
}

class _StyledPasswordTextFieldState extends State<StyledPasswordTextField> {
  bool _isObscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isObscure,
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: widget.label,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: _isObscure
                ? Icon(Icons.visibility)
                : Icon(Icons.visibility_off),
          )),
    );
  }
}
