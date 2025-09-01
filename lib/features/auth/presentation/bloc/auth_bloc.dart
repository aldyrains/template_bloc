// TODO: This file requires flutter_bloc and equatable packages to be installed
// For now, it's a placeholder that will be implemented when dependencies are added

import '../../domain/entities/user.dart';
import '../../domain/usecases/sign_in_usecase.dart';

// Placeholder implementations for Bloc classes
// TODO: Replace with actual Bloc implementation when flutter_bloc is available

// Events
abstract class AuthEvent {
  const AuthEvent();
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested({
    required this.email,
    required this.password,
  });
}

class SignOutRequested extends AuthEvent {}

class AuthCheckRequested extends AuthEvent {}

// States
abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final User user;

  const Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);
}

// Bloc
class AuthBloc {
  final SignInUseCase signInUseCase;

  AuthBloc({required this.signInUseCase});

  // TODO: Implement actual Bloc methods when flutter_bloc is available

  void add(AuthEvent event) {
    // TODO: Implement event handling
  }

  Stream<AuthState> get stream {
    // TODO: Return actual state stream
    return const Stream.empty();
  }

  AuthState get state => AuthInitial();
}
