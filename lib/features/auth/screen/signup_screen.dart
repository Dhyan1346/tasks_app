import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_tasks/core/router/routerconstants.dart';
import 'package:todo_tasks/core/widgets/custom_textfield.dart';
import 'package:todo_tasks/core/widgets/custombutton.dart';
import 'package:todo_tasks/features/auth/auth_provider/auth_provider.dart';
import 'package:todo_tasks/features/auth/controller/auth_controller.dart';
import 'package:todo_tasks/features/auth/screen/login_screen.dart';
import '../../../core/widgets/customtext.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(text: "Create Account", fontSize: 20),
              const SizedBox(height: 20),
              CustomFormField(controller: emailController, hintText: "Email"),
              const SizedBox(height: 15),
              CustomFormField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Sign Up",
                onTap: () {
                  ref.read(authServiceProvider).SignUp(emailController.text.trim(), passwordController.text.trim());

                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        },),
                      );
                    },
                    child: CustomText(text: "Login"),
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
