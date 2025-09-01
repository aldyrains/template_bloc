// TODO: This file requires get_it and injectable packages to be installed
// For now, it's a placeholder that will be implemented when dependencies are added

import '../network/network_info.dart';
import '../network/dio_client.dart';

// Placeholder for dependency injection
// TODO: Implement actual DI when get_it and injectable are available

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  // Simple service locator implementation
  final NetworkInfo _networkInfo = NetworkInfoImpl();
  final DioClient _dioClient = DioClient();

  NetworkInfo get networkInfo => _networkInfo;
  DioClient get dioClient => _dioClient;
}

// Global instance
final getIt = ServiceLocator();

// TODO: Replace with actual DI configuration
Future<void> configureDependencies() async {
  // Dependencies will be registered here when get_it is available
}
