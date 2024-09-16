import 'package:flutter/material.dart';

class CommonSnackBarMessage {

  static noInternetConnection(BuildContext context) {
    const snackBar = SnackBar(
      content: Text("You are Offline !! Please check internet connection."),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating, // Makes it float near the top
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static errorMessage({required BuildContext context, String? title, required String text}) {
    final snackBar = SnackBar(
      content: Text(
        title != null ? "$title: $text" : text,
        style: const TextStyle(color: Colors.red), // Text color
      ),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
