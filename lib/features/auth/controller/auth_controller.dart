// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod/legacy.dart';
// import 'package:todo_tasks/features/auth/repositary/auth_repositary.dart';
//
// class AuthController extends StateNotifier<AsyncValue<void>> {
//   final AuthRepository _repository;
//
//   AuthController(this._repository) : super(const AsyncValue.data(null));
//
//   Future<void> login(String email, String password) async {
//     state = const AsyncValue.loading();
//     try {
//       await _repository.login(email, password);
//       state = const AsyncValue.data(null);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
//
//   Future<void> signup(String email, String password) async {
//     state = const AsyncValue.loading();
//     try {
//       await _repository.signup(email, password);
//       state = const AsyncValue.data(null);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
//
//   Future<void> logout() async {
//     await _repository.logout();
//   }
// }
