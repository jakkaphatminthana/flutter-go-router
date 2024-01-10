import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopDetailScreen extends StatelessWidget {
  final String? produceName;

  const ShopDetailScreen({
    super.key,
    this.produceName,
  });

  void _navigateToHome(BuildContext context) {
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final String produce = produceName ?? 'Nothing';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Shop Detail",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(produce, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _navigateToHome(context),
                child: const Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
