# D-Crypto Lite

A modern Flutter clone of the popular Dantown app, built to showcase my skills in Flutter development, UI/UX, and app architecture.

---

## 🌟 Features

-   Clean, modern UI inspired by Dantown
-   Wallet dashboard with balances and growth stats
-   Buy/Sell crypto interface
-   Airtime top-up page
-   Transaction history
-   User profile management
-   Mocked authentication flow
-   State management with Provider
-   Modular, scalable folder structure

---

## 🚀 Getting Started

### Prerequisites

-   Flutter SDK (3.x recommended)
-   Dart SDK (3.x recommended)
-   Your preferred IDE (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/yourusername/d_crypto_lite.git
    cd d_crypto_lite
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**
    ```bash
    flutter run
    ```

---

## 🏗️ Project Structure

```
lib/
├── app/
│   ├── core/
│   │   ├── gen/                # Generated assets (images, etc.)
│   │   ├── theme.dart          # App theme and colors
│   │   └── widgets/            # Shared widgets (e.g., wallet_display.dart)
│   └── features/
│       └── trade/
│           └── presentation/
│               └── screens/
│                   └── buy_sell_screen.dart
├── main.dart                   # App entry point
├── d_crypto_lite.dart 			# Main app widget
```

---

## 📄 Assets

```
assets/
├── images/
│   ├── exchange.png
│   ├── virtual_card.png
│   └── ...other icons
└── fonts/
    └── ...font files
```

---

## 📚 Tech Stack

-   **State Management:** Provider
-   **UI:** Material Design, custom widgets
-   **Mock Data:** Local JSON
-   **Architecture:** Modular, feature-first

---

## 🛠️ Development

### Adding New Features

1. Create a new feature directory under `lib/features/`
2. Implement your screens, models, and providers
3. Add tests and update documentation as needed

---

## 📱 Building for Production

To build the release version:

```bash
# Android
flutter build apk

# iOS
flutter build ios
```

---

## 📸 Screenshots

> Add some screen grabs of your UI here

---

## 🤔 Why This Project?

This project was built as a personal exercise to demonstrate my ability to think like a product engineer, not just a Flutter coder. It reflects core concepts like:

-   Reusable widgets
-   Data-driven UIs
-   Thoughtful UX for mobile fintech apps
-   Clean, maintainable code

---

## 📄 License

MIT – feel free to fork and build your own features!

---

## 👤 Author

-   [Chidiebube Iroezindu](mailto:your.email@example.com)
