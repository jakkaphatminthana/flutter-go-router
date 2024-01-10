import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  void _navigateToHome(BuildContext context) {
    context.go('/');
  }

  void _navigateToDetail({
    required BuildContext context,
    required String name,
  }) {
    context.push(
      Uri(
        path: '/shop/detail',
        queryParameters: {'name': name},
      ).toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Shop",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _navigateToHome(context),
                child: const Text("Home"),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _navigateToDetail(
                      context: context,
                      name: "Apple",
                    ),
                    child: const Text("Apple"),
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToDetail(
                      context: context,
                      name: "Banana",
                    ),
                    child: const Text("Banana"),
                  ),
                  ElevatedButton(
                    onPressed: () => _navigateToDetail(
                      context: context,
                      name: "Orange",
                    ),
                    child: const Text("Orange"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
