# 🚚 Hadj Delivery – Food Delivery App

<div align="center">

**Your Favorite Restaurant in Qais – Fast & Reliable Delivery**

![Flutter](https://img.shields.io/badge/Flutter-3.16.0-blue)
![Dart](https://img.shields.io/badge/Dart-3.2.0-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-orange)
![Arabic](https://img.shields.io/badge/Arabic-Full%20Support-green)

</div>

---

## 📱 Project Overview

**Hadj Delivery** is a full-featured food delivery application built with **Flutter**, designed specifically for residents of **Qais, Algeria**. The app connects users with local restaurants and shops while delivering a smooth **Arabic‑first user experience**.

---

## ✨ Key Features

* ✅ **Full Arabic Interface** – UI and UX designed for Arabic users
* 🛍️ **Multi‑Store Shopping** – Restaurants, sweets, supermarkets, butchers, and more
* 🚚 **Order Tracking** – Real‑time order status updates
* 💳 **Secure Payments** – Multiple safe payment options
* ⭐ **Rating System** – Rate stores and meals
* 🎯 **Smart Search** – Quickly find food or stores
* 📱 **Responsive UI** – Works smoothly on all screen sizes
* 🔔 **Push Notifications** – Orders, offers, and promotions
* 📊 **Order History** – Track past orders and favorites

---

## 📁 Project Structure

```
hadj_delivery/
├── 📁 android/                    # Native Android files
├── 📁 ios/                        # Native iOS files
├── 📁 lib/                        # Main application code
│   ├── 📁 constants/              # Global constants and variables
│   │   └── colors.dart            # App colors
│   │
│   ├── 📁 models/                 # Data models
│   │   ├── onboarding_model.dart  # Onboarding screens model
│   │   ├── store_model.dart       # Store model
│   │   ├── category_model.dart    # Category model
│   │   ├── item_model.dart        # Item model
│   │   ├── class_item_model.dart  # Store sections model
│   │   ├── adsmodels.dart         # Ads model
│   │   └── store_data_manager.dart# Store data manager
│   │
│   ├── 📁 splash/                 # Splash screen
│   │   ├── splash_screen.dart     # Main splash screen
│   │   ├── splash_content.dart    # Splash content
│   │   ├── splash_logo.dart       # App logo
│   │   ├── splash_title.dart      # App title
│   │   ├── splash_tagline.dart    # Tagline
│   │   └── splash_loader.dart     # Loading indicator
│   │
│   ├── 📁 login/                  # Authentication system
│   │   ├── 📁 screens/
│   │   │   ├── login/
│   │   │   │   ├── login_page.dart
│   │   │   │   ├── login_form.dart
│   │   │   │   ├── login_fields.dart
│   │   │   │   ├── login_buttons.dart
│   │   │   │   ├── login_toggle.dart
│   │   │   │   └── phone_confirmation_dialog.dart
│   │   │   ├── onboarding/
│   │   │   │   ├── onboarding_page.dart
│   │   │   │   │   ├── onboarding_content.dart
│   │   │   │   │   ├── onboarding_item.dart
│   │   │   │   │   ├── onboarding_dots.dart
│   │   │   │   │   └── onboarding_buttons.dart
│   │   │   └── validators.dart
│   │
│   ├── 📁 pages/                  # Main pages
│   │   ├── 📁 home/
│   │   │   ├── home.dart
│   │   │   ├── 📁 widgets/
│   │   │   │   ├── 📁 appbar/
│   │   │   │   │   ├── appbar.dart
│   │   │   │   │   ├── appbar_leading.dart
│   │   │   │   │   ├── appbar_actions.dart
│   │   │   │   │   ├── profile_drawer.dart
│   │   │   │   │   └── sitting_drawer.dart
│   │   │   │   ├── 📁 body/
│   │   │   │   │   ├── 📁 searchcolum/
│   │   │   │   │   │   └── searchbar.dart
│   │   │   │   │   ├── 📁 category/
│   │   │   │   │   │   ├── category.dart
│   │   │   │   │   │   └── categorymodel.dart
│   │   │   │   │   ├── 📁 ads/
│   │   │   │   │   │   ├── adsslids.dart
│   │   │   │   │   │   └── adsmodels.dart
│   │   │   │   │   └── 📁 stores/
│   │   │   │   │       └── stores_horizontal_list.dart
│   │   ├── 📁 store_page/
│   │   │   ├── storepage.dart
│   │   │   ├── anythingpage.dart
│   │   │   └── 📁 store_widget/
│   │   │       ├── informationstore.dart
│   │   │       ├── classesitemes.dart
│   │   │       └── itemes.dart
│   │   ├── 📁 bottunbar/
│   │   │   ├── mainlyout.dart
│   │   │   └── buttumbar.dart
│   │   ├── 📁 settings/
│   │   ├── 📁 profile/
│   │   └── 📁 cart/
│   │
│   ├── 📁 widgets/
│   │   └── custom_text_field.dart
│   │
│   └── main.dart
│
├── 📁 assets/
│   ├── 📁 images/
│   ├── 📁 icons/
│   ├── 📁 lottie/
│   └── 📁 fonts/
│
├── 📁 test/
├── pubspec.yaml
└── README.md
```

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK **3.16.0+**
- Dart SDK **3.2.0+**
- VS Code or Android Studio
- Git

### Installation

```bash
git clone https://github.com/yourusername/hadj-delivery.git
cd hadj-delivery
flutter pub get
````

### Run the App

```bash
# Android
flutter run -d android

# iOS
flutter run -d ios

# Web
flutter run -d chrome
```

### Build

```bash
flutter build apk --release
flutter build ipa --release
flutter build web --release
```

---

## ⚙️ Configuration

### App Colors (`constants/colors.dart`)

```dart
class AppColors {
  static const Color primary = Color(0xFFFF7F00);
  static const Color secondary = Colors.white;
  static const Color thirdly = Color.fromRGBO(255, 161, 102, 1);
  static const Color background = Colors.white;
  static const Color cardBackground = Color(0xFFFFF3E0);
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Color(0xFF757575);
}
```

---

## 🧱 Data Models

### Store Model

```dart
class StoreModel {
  final String id;
  final String name;
  final String specialty;
  final String categoryId;
  final String location;
  final int orderCount;
  final double rating;
  final bool isOpen;
  final double deliveryPrice;
  final bool isPromoted;
  final bool isExclusive;
  final List<String> categories;
}
```

### Item Model

```dart
class ItemModel {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;
  final bool isPopular;
  final String description;
  final String classItemId;
  final String storeId;
  final bool isAvailable;
  final int preparationTime;
}
```

---

## 🏗️ Architecture Overview

* **State Management:** `StatefulWidget` (local) + `Provider` (planned global state)
* **Navigation:** `Navigator.push` / `pushReplacement`
* **Responsive Design:** `MediaQuery` & `LayoutBuilder`

---

## 📱 Main UI Components

* **Custom AppBar** – Profile & settings access
* **Bottom Navigation Bar** – Orders, Home, Cart
* **CustomTextField** – Unified form inputs

---

## 🧪 Testing

```bash
flutter test
flutter test integration_test/
```

---

## 📊 Performance Tips

* Use `ListView.builder`
* Preload images with `precacheImage`
* Use `const` widgets where possible
* Compress images

---

## 🚨 Troubleshooting

### Images Not Showing

```yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/lottie/
```

### Arabic Font Issues

```yaml
dependencies:
  arabic_font: ^latest_version
```

---

## 🔄 Development Workflow

```bash
git checkout -b feature/new-feature
git add .
git commit -m "Add new feature"
git push origin feature/new-feature
```

---

## 📦 Main Dependencies

| Package         | Description      | Version |
| --------------- | ---------------- | ------- |
| flutter         | Framework        | 3.16.0  |
| arabic_font     | Arabic fonts     | latest  |
| lottie          | Animations       | latest  |
| provider        | State management | latest  |
| carousel_slider | Sliders          | latest  |

---

## 📄 License

MIT License © 2024 Hadj Delivery

---

## 📞 Contact

* **Email:** [vinnyhalitimb47@gmail.com ](mailto:vinnyhalitimb47@gmail.com)
  
* **Location:** Qais, Algeria

---

<div align="center">

 made by : HADJ DELIVERY DEV TEAM
![DZ](assets/images/HD_logo.png)

</div>
