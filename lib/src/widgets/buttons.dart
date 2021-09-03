import 'package:flutter/material.dart';

class ColoredButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final double width;
  const ColoredButton(
      {Key? key, required this.label, this.onPressed, this.width = 400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 48),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  const SocialButton({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 30,
            ),
            Text(label)
          ],
        ),
      ),
    );
  }
}
