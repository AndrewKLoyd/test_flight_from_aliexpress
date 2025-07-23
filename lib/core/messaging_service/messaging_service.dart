import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagingService {
  static MessagingService of(BuildContext context) =>
      Provider.of<MessagingService>(context, listen: false);
  void showMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text(message),
        elevation: 5,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
