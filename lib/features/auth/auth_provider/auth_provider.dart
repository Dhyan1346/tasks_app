import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_tasks/features/auth/repositary/auth_repositary.dart';

final authServiceProvider= Provider<AuthRepositary>((ref) {
  return AuthRepositary();

},);

final authStateProvider=StreamProvider((ref) {

  final authstate=FirebaseAuth.instance.authStateChanges();
  print(authstate);
  return authstate;



},);