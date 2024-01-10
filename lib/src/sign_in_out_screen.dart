import 'package:flutter/material.dart';
import 'package:flutter_go_router/core/providers/auth_services_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignInOutScreen extends ConsumerWidget {
  const SignInOutScreen({super.key});

  void _signIn(WidgetRef ref) {
    ref.read(authServiceProvider.notifier).signIn();
  }

  void _signOut(WidgetRef ref) {
    ref.read(authServiceProvider.notifier).signOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authToken = ref.watch(authServiceProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "SignIn/Out",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text("Home"),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _signIn(ref),
                  child: const Text("SignIn"),
                ),
                if (authToken != null) ...[
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => _signOut(ref),
                    child: const Text("SignOut"),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
