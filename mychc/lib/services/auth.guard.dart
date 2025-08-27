import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/screens/loginPage.dart';

final authGuardProvider = Provider<AuthGuard>((ref) {
  return AuthGuard(ref);
});

class AuthGuard {
  final Ref _ref;

  AuthGuard(this._ref);

  bool get isAuthenticated {
    final authState = _ref.read(authControllerProvider);
    return authState.value != null && authState.value?.token != null;
  }

  String? get token {
    final authState = _ref.read(authControllerProvider); 
    return authState.value?.token;
  }

  // Redirect to login if not authenticated
  void requireAuth(BuildContext context) {
    if (!isAuthenticated) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
        (route) => false,
      );
    }
  }
}