# Template Bloc - Flutter Clean Architecture Template

A comprehensive Flutter project template built with Clean Architecture principles, Bloc state management, and modern development practices.

## 🚀 Features

- **Clean Architecture** - Separation of concerns with domain, data, and presentation layers
- **Bloc State Management** - Predictable state management with flutter_bloc
- **Responsive Design** - Mobile, tablet, and web support
- **Material 3 Design** - Modern UI following Material Design guidelines
- **Authentication System** - JWT-based authentication with social login support
- **Onboarding Flow** - First-time user experience
- **Testing Ready** - Unit tests, widget tests, and integration tests
- **CI/CD Pipeline** - GitHub Actions for automated testing and building
- **Multi-platform** - Android, iOS, Web, Desktop support

## 🏗️ Architecture

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants and configuration
│   ├── di/                 # Dependency injection
│   ├── error/              # Error handling and failures
│   ├── network/            # Network layer and HTTP client
│   ├── theme/              # App theming and styling
│   └── utils/              # Utility functions
├── features/               # Feature modules
│   ├── auth/               # Authentication feature
│   │   ├── domain/         # Business logic and entities
│   │   ├── data/           # Data sources and repositories
│   │   └── presentation/   # UI and state management
│   └── onboarding/         # Onboarding feature
└── main.dart               # App entry point
```

## 🛠️ Tech Stack

- **Flutter** - UI framework
- **Dart** - Programming language
- **Bloc** - State management
- **Clean Architecture** - Project structure
- **Material 3** - Design system
- **Testing** - Unit, widget, and integration tests

## 📱 Screenshots

### Onboarding
- Welcome screens with smooth transitions
- Feature highlights and app introduction
- Skip option for returning users

### Authentication
- Clean login form with validation
- Social login integration (Google, Facebook)
- Password reset functionality

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/template_bloc.git
   cd template_bloc
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Environment Setup

Create a `.env` file in the root directory:

```env
# API Configuration
BASE_URL=https://api.example.com
API_VERSION=/v1

# Feature Flags
ENABLE_ANALYTICS=true
ENABLE_CRASHLYTICS=true
ENABLE_ADS=false
```

## 🧪 Testing

### Run Tests

```bash
# Unit and widget tests
flutter test

# Integration tests
flutter test integration_test/

# Test coverage
flutter test --coverage
```

### Test Structure

- `test/` - Unit and widget tests
- `integration_test/` - End-to-end tests
- `test/` - Feature-specific tests

## 🏗️ Building

### Android

```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (recommended for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Debug build
flutter build ios --debug

# Release build
flutter build ios --release
```

### Web

```bash
# Debug build
flutter build web --debug

# Release build
flutter build web --release
```

## 📦 CI/CD

The project includes GitHub Actions workflows for:

- **Testing** - Automated testing on push/PR
- **Building** - APK, AAB, and iOS builds
- **Quality Checks** - Code analysis and linting

### Workflow Files

- `.github/workflows/flutter_ci.yml` - Main CI/CD pipeline

## 🔧 Configuration

### Build Flavors

The project supports multiple build flavors:

- **development** - Development environment
- **staging** - Staging environment  
- **production** - Production environment

### Feature Flags

Toggle features on/off using environment variables:

- Analytics
- Crash reporting
- Ads
- Social login

## 📚 Documentation

### Architecture Patterns

- **Clean Architecture** - Separation of concerns
- **Repository Pattern** - Data access abstraction
- **Use Case Pattern** - Business logic encapsulation
- **Bloc Pattern** - State management

### State Management

- **Events** - User actions and system events
- **States** - UI state representation
- **Blocs** - Business logic and state transitions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Bloc library contributors
- Clean Architecture principles by Uncle Bob
- Material Design team

## 📞 Support

- **Issues** - [GitHub Issues](https://github.com/aldyrains/template_bloc/issues)
- **Discussions** - [GitHub Discussions](https://github.com/aldyrains/template_bloc/discussions)
- **Email** - aldyrains30@gmail.com

---

**Made with ❤️ by Aldy Rains**
