import '../repositories/auth_repository.dart';
import '../entities/user.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<User> call(String email, String password, String name) async {
    // Basic validation
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw ArgumentError('Email, password, and name cannot be empty');
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

    // Name length validation
    if (name.trim().length < 2) {
      throw ArgumentError('Name must be at least 2 characters');
    }

    return await repository.signUpWithEmailAndPassword(email, password, name);
  }
}
