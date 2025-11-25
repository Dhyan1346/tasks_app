import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_tasks/core/widgets/AsyncDataWidget.dart';
import 'package:todo_tasks/features/auth/auth_provider/auth_provider.dart';
import 'package:todo_tasks/features/auth/screen/login_screen.dart';
import 'package:todo_tasks/features/bottom_navigation_bar/screen/BottomNavBar.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authStateProvider);

    return AsyncDataWidget(
      asyncValue: auth,
      builder: (user) {
        // Check if user is logged in
        if (user != null) {
          print(user);
          return  BottomNavBarApp(); // Home Page
        } else {
          print(user);
          return  LoginScreen(); // Show Login Page
        }
      },
    );
  }
}
