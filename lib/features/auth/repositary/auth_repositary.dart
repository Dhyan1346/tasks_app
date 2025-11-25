import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_tasks/core/widgets/customtoast.dart';

class AuthRepositary {
  Future<UserCredential?> SignUp(String email, String password) async {
    try {
      UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomToast.show("Signup successful!",gravity: ToastGravity.CENTER);
      return  userCredential;
} on FirebaseAuthException catch (e) {
      print('FirebaseAuth error: $e');
      CustomToast.show("Signup error: ${e.message}");
      return null;
    } catch (e) {
      CustomToast.show("Unknown error: $e");
      return null;
    }
  }

  Future<UserCredential?> Login(String email, String password) async {
    try {
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      CustomToast.show("Login successful!");
      return userCredential;



    } on FirebaseAuthException catch (e) {
      print('FirebaseAuth error: $e');
      CustomToast.show("Login error: ${e.message}");
      return null;
    } catch (e) {
      CustomToast.show("Unknown error: $e");
      return null;
    }
  }

  Future<void> SignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      CustomToast.show("Signed out successfully");
    } catch (e) {
      CustomToast.show("Sign out failed: $e");
    }
  }

}
