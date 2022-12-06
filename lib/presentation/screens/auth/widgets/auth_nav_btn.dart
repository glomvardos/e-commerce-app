import 'package:flutter/material.dart';

class AuthNavButton extends StatelessWidget {
  const AuthNavButton({
    Key? key,
    required this.text,
    required this.btnText,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final String btnText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(text),
        TextButton(
          onPressed: onPressed,
          child: Text(
            btnText,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
