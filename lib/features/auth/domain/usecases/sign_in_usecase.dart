import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call(String email, String password) async {
    // Basic validation
    if (email.isEmpty || password.isEmpty) {
      throw ArgumentError('Email and password cannot be empty');
    }

    // Email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }

    // Password length validation
    if (password.length < 6) {
      throw ArgumentError('Password must be at least 6 characters');
    }

    return await repository.signInWithEmailAndPassword(email, password);
  }
}
