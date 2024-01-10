import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorType;

  const ErrorScreen({
    super.key,
    this.errorType,
  });

  @override
  Widget build(BuildContext context) {
    final String errorLabel = errorType ?? 'Something wrong';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              errorLabel,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }
}
