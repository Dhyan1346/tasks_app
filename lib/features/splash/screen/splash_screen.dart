import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_tasks/core/widgets/AsyncDataWidget.dart';
import 'package:todo_tasks/features/auth/screen/login_screen.dart';
import 'package:todo_tasks/features/splash/controller/splash_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return  const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
