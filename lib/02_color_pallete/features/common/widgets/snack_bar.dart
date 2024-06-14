import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message}) {
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: 800),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: const Color(0xCC090E2E),
      elevation: 0,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, height: 16 / 16),
        ),
      ),
    ),
  );
}
