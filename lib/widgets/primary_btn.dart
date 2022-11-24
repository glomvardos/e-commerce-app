import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    Key? key,
    required this.text,
    required this.onClickHandler,
  }) : super(key: key);
  final String text;
  final Function onClickHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onClickHandler(),
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          color: Color(0xFFEEEEEE),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        minimumSize: const Size(double.infinity, 55),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Text(text),
    );
  }
}
