import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    Key? key,
    required this.labelText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  }) : super(key: key);

  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return '';
        }
        return null;
      },
      showCursor: true,
      cursorColor: Theme.of(context).colorScheme.secondary,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      maxLength: maxLines == 1 ? null : 160,
      style: const TextStyle(
        color: Color(0xFFEEEEEE),
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(height: 0),
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFFEEEEEE), fontSize: 14),
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
