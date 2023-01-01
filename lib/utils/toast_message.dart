import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ToastMessage {
  static void success(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static void error(BuildContext context, DioError error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(error.response!.data['detail'] ?? 'Something went wrong'),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
