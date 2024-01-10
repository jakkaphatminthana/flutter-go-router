import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  void _navigateToSignIn() {
    context.go('/sign-in-out');
  }

  void _navigateToShop() {
    context.push('/shop');
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
                "Home",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _navigateToShop(),
                child: const Text("Next Page"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _navigateToSignIn(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black12,
                ),
                child: const Text(
                  "SignIn/Out",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
