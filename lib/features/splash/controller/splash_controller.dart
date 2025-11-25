


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseauthprovider=Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
},);

final authStateProvider=StreamProvider<User?>((ref) {


  final auth=ref.watch(firebaseauthprovider);
  return auth.authStateChanges();
},);