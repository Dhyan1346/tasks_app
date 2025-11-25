// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod/src/framework.dart';
// import 'package:todo_tasks/core/router/routerconstants.dart';
// import 'package:todo_tasks/features/auth/auth_provider/auth_provider.dart';
// import 'package:todo_tasks/features/auth/screen/login_screen.dart';
// import 'package:todo_tasks/features/auth/screen/signup_screen.dart';
// import 'package:todo_tasks/features/splash/screen/home_screen.dart';
// import 'package:todo_tasks/features/splash/screen/splash_screen.dart';
//
//
// import '../../features/splash/controller/splash_controller.dart' hide authStateProvider;
//
// class AppRouter {
//   static final routerProvider = Provider<GoRouter>((ref) {
//     return GoRouter(
//       initialLocation: '/login',
//
//       routes: [
//         GoRoute(
//           path: '/',
//           name: routerconstants.splash,
//           builder: (context, state) => const SplashScreen(),
//         ),
//         GoRoute(
//           path: '/login',
//           name: routerconstants.login,
//           builder: (context, state) => LoginScreen(),
//         ),
//         GoRoute(
//           path: '/signup',
//           name: routerconstants.signup,
//           builder: (context, state) => SignUpScreen(),
//         ),
//         GoRoute(
//           path: '/home',
//           name: routerconstants.home,
//           builder: (context, state) => const HomeScreen(),
//         ),
//       ],
//     );
//   });
// }
//
//
//
//
// class GoRouterRefreshStream extends ChangeNotifier {
//   GoRouterRefreshStream(Stream<dynamic> stream) {
//     stream.listen((_) => notifyListeners());
//   }
// }
