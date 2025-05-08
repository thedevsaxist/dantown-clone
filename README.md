# D-Crypto Lite

A mini crypto wallet UI built with Flutter, inspired by Dantown’s fintech product ecosystem.

## Overview

This project is a simple simulation of a crypto and airtime transaction app. It demonstrates clean UI architecture, state management using Provider, and Flutter best practices for building scalable and maintainable mobile apps.

**Features:**
- Login screen (mocked authentication)
- Dashboard with wallet balance and recent transactions
- Buy/Sell crypto interface
- Airtime top-up page
- User profile management

## Screenshots

> Add some screen grabs of your UI here

## Folder Structure
```
lib/
├── main.dart
├── core/
│ └── theme.dart
├── data/
│ └── mock_data.json
├── models/
│ └── transaction_model.dart
├── providers/
│ └── transaction_provider.dart
├── screens/
│ ├── login_screen.dart
│ ├── dashboard_screen.dart
│ ├── buy_sell_screen.dart
│ ├── airtime_screen.dart
│ └── profile_screen.dart
└── widgets/
└── transaction_tile.dart
```


## Tech Stack

- Flutter 3.x
- Provider for state management
- Mock JSON data as the local "backend"
- Dart custom models and services

## How to Run

1. Clone the repository
2. Run `flutter pub get`
3. Start the emulator or connect a device
4. Run `flutter run`

## Why This Project?

This project was built as a personal exercise to demonstrate my ability to think like a product engineer, not just a Flutter coder. It reflects core concepts like:

- Reusable widgets
- Data-driven UIs
- Thoughtful UX for mobile fintech apps

## License

MIT – feel free to fork and build your own features!
