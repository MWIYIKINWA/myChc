import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/models/user_model.dart';
import 'package:mychc/services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

final authControllerProvider =
    StateNotifierProvider<AuthController, AsyncValue<User?>>((ref) {
      return AuthController(ref.watch(apiServiceProvider));
    });

class AuthController extends StateNotifier<AsyncValue<User?>> {
  final ApiService _apiService;

  AuthController(this._apiService) : super(const AsyncValue.data(null));

  // Future<void> login(String email, String password) async {
  //   state = const AsyncValue.loading();
  //   try {
  //     final user = await _apiService.login(email, password);
  //     state = AsyncValue.data(user);
  //   } catch (error) {
  //     state = AsyncValue.error(error, StackTrace.current);
  //   }
  // }
  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final user = await _apiService.login(email, password);
      state = AsyncValue.data(user);
    } catch (error) {
      // Extract clean error message
      String errorMessage = error.toString();

      // Remove "Exception: " prefix if present
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }

      state = AsyncValue.error(errorMessage, StackTrace.current);
    }
  }

  // Future<void> register(
  //   String name,
  //   String email,
  //   String password,
  //   String passwordConfirmation,
  // ) async {
  //   state = const AsyncValue.loading();
  //   try {
  //     final user = await _apiService.register(
  //       name,
  //       email,
  //       password,
  //       passwordConfirmation,
  //     );
  //     state = AsyncValue.data(user);
  //   } catch (error) {
  //     state = AsyncValue.error(error, StackTrace.current);
  //   }
  // }

  Future<void> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    state = const AsyncValue.loading();
    try {
      final user = await _apiService.register(
        name,
        email,
        password,
        passwordConfirmation,
      );
      state = AsyncValue.data(user);
    } catch (error) {
      String errorMessage = error.toString();
      if (errorMessage.startsWith('Exception: ')) {
        errorMessage = errorMessage.substring(11);
      }
      state = AsyncValue.error(errorMessage, StackTrace.current);
    }
  }

  Future<void> logout(String token) async {
    try {
      await _apiService.logout(token);
      state = const AsyncValue.data(null);
    } catch (error) {
      state = AsyncValue.error(error, StackTrace.current);
    }
  }
}
