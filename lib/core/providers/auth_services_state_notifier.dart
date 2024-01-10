import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = StateNotifierProvider<AuthServiceNotifier, String?>(
  (ref) => AuthServiceNotifier(),
);

class AuthServiceNotifier extends StateNotifier<String?> {
  AuthServiceNotifier() : super(null);

  void signIn() {
    state = "mockup";
  }

  void signOut() {
    state = null;
  }
}
