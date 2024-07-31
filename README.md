# TMDB Movie Recommendation App

A clean architecture Flutter project utilizing the TMDB API to provide movie recommendations. This project demonstrates proficiency in Flutter development, including the use of the BLoC pattern for state management.

## ✨ Requirements

- Any operating system (e.g., macOS, Linux, Windows)
- Latest version of Flutter and Android SDK installed
- Any IDE with Flutter development support (e.g., IntelliJ IDEA, Android Studio, VSCode)
- Device for testing (physical or emulator)
- TMDB API key (Generate from [TMDB API](https://developer.themoviedb.org/reference/intro/getting-started))

## 🚀 Features

### Theme
- Supports dark and light modes based on system preference

### Home Screen
- Displays:
  - Popular movies
  - Top-rated movies
  - Upcoming movies
- Pull to refresh functionality

### Movie Details
- Shows:
  - Poster and backdrop images
  - Score/rating
  - Link to trailer on YouTube
  - Release date, runtime, and certifications
  - Overview
  - Cast and crew information
  - Recommendations

## 🏗️ Project Architecture

This project follows the principles of Clean Architecture, ensuring a scalable, maintainable, and testable codebase. The app is structured into distinct layers, each with a clear responsibility.

### Layers
- **Presentation Layer**: 
  - UI components and Flutter widgets
  - BLoC (Business Logic Component) for state management
- **Domain Layer**: 
  - Models and repositories interface
  - Business logic implementation
- **Data Layer**: 
  - Data sources (remote and local)
  - Repository implementation

## 📚 State Management

The app uses the BLoC (Business Logic Component) pattern for efficient state management. BLoC helps to separate business logic from UI components, making the code more modular and testable.

## 📂 Directory Structure
```markdown
lib/
├── data/
│ ├── datasources/
│ ├── models/
│ ├── repositories/
├── domain/
│ ├── entities/
│ ├── repositories/
│ ├── usecases/
├── presentation/
│ ├── blocs/
│ ├── pages/
│ ├── widgets/
└── main.dart
```

## 🌟 Highlighted Skills

- **Clean Architecture**: Ensuring a modular and maintainable codebase
- **BLoC Pattern**: Efficient state management
- **Flutter Development**: Building a responsive and dynamic UI
- **Integration with External APIs**: Consuming and displaying data from the TMDB API
- **Theming**: Implementing dynamic theming (dark/light mode)
- **Performance Optimization**: Using pull-to-refresh and efficient data handling

## Important Note
- Due to restrictions by the Indian Government, the TMDB API will not work on mobile data. Please use Wi-Fi for access.


## 👥 Contributors

- [Gaurav Mishra](https://github.com/gauravsmishra) - Initial work

Feel free to explore, contribute, and provide feedback!
