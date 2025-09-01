import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> signUpWithEmailAndPassword(
      String email, String password, String name);
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Future<void> signOut();
  Future<User?> getCurrentUser();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> updateProfile(String name, String? profilePicture);
  Future<void> deleteAccount();
  Future<bool> isAuthenticated();
  Future<void> refreshToken();
}
