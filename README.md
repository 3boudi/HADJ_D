🚚 Hadj Delivery - Food Delivery App
<div align="center">
Your Favorite Restaurant in Qais - Fast & Reliable Delivery

https://img.shields.io/badge/Flutter-3.16.0-blue
https://img.shields.io/badge/Dart-3.2.0-blue
https://img.shields.io/badge/License-MIT-green
https://img.shields.io/badge/Platform-Android%2520%257C%2520iOS-orange
https://img.shields.io/badge/Arabic-Full%2520Support-green

</div>
📱 Project Overview
Hadj Delivery is a comprehensive food delivery application specifically designed for residents of Qais, Algeria. The app connects users with various local restaurants and shops while providing a seamless Arabic-first user experience.

✨ Key Features
✅ Full Arabic Interface - Design tailored for Arabic language

🛍️ Multi-Store Shopping - Browse restaurants, sweets, supermarkets, butchers, and more

🚚 Order Tracking - Real-time order status updates

💳 Secure Payments - Multiple secure payment options

⭐ Rating System - Rate stores and meals

🎯 Smart Search - Easily find food or stores

📱 Responsive UI - Adaptive design for all devices

🔔 Push Notifications - Order updates and promotions

📊 Order History - Track past orders and favorites

📁 Project Structure
text
hadj_delivery/
├── 📁 android/                    # Native Android files
├── 📁 ios/                        # Native iOS files
├── 📁 lib/                        # Main application code
│   ├── 📁 constants/              # Global constants and variables
│   │   └── colors.dart           # App colors
│   │
│   ├── 📁 models/                 # Data models
│   │   ├── onboarding_model.dart # Onboarding screens model
│   │   ├── store_model.dart      # Store model
│   │   ├── category_model.dart   # Category model
│   │   ├── item_model.dart       # Item model
│   │   ├── class_item_model.dart # Store sections model
│   │   ├── adsmodels.dart        # Ads model
│   │   └── store_data_manager.dart # Store data manager
│   │
│   ├── 📁 splash/                 # Splash screen
│   │   ├── splash_screen.dart    # Main splash screen
│   │   ├── splash_content.dart   # Splash content
│   │   ├── splash_logo.dart      # App logo
│   │   ├── splash_title.dart     # App title
│   │   ├── splash_tagline.dart   # Tagline
│   │   └── splash_loader.dart    # Loading indicator
│   │
│   ├── 📁 login/                  # Authentication system
│   │   ├── 📁 screens/
│   │   │   ├── login/
│   │   │   │   ├── login_page.dart         # Login page
│   │   │   │   ├── login_form.dart         # Login form
│   │   │   │   ├── login_fields.dart       # Login fields
│   │   │   │   ├── login_buttons.dart      # Login buttons
│   │   │   │   ├── login_toggle.dart       # Toggle login/signup
│   │   │   │   └── phone_confirmation_dialog.dart # Phone confirmation
│   │   │   │
│   │   │   ├── onboarding/
│   │   │   │   ├── onboarding_page.dart    # Onboarding page
│   │   │   │   ├── onboarding_content.dart # Onboarding content
│   │   │   │   ├── onboarding_item.dart    # Onboarding item
│   │   │   │   ├── onboarding_dots.dart    # Navigation dots
│   │   │   │   └── onboarding_buttons.dart # Onboarding buttons
│   │   │   │
│   │   │   └── validators.dart             # Input validators
│   │   │
│   ├── 📁 pages/                  # Main pages
│   │   ├── 📁 home/               # Home page
│   │   │   ├── home.dart          # Home screen
│   │   │   ├── 📁 widgets/
│   │   │   │   ├── 📁 appbar/     # App bar
│   │   │   │   │   ├── appbar.dart
│   │   │   │   │   ├── appbar_leading.dart
│   │   │   │   │   ├── appbar_actions.dart
│   │   │   │   │   ├── profile_drawer.dart
│   │   │   │   │   └── sitting_drawer.dart
│   │   │   │   │
│   │   │   │   ├── 📁 body/       # Page body
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
│   │   │   │   │
│   │   ├── 📁 store_page/         # Store page
│   │   │   ├── storepage.dart     # Main store page
│   │   │   ├── anythingpage.dart  # "Order Anything" page
│   │   │   └── 📁 store_widget/
│   │   │       ├── informationstore.dart # Store information
│   │   │       ├── classesitemes.dart    # Store sections
│   │   │       └── itemes.dart           # Store items
│   │   │
│   │   ├── 📁 bottunbar/          # Bottom navigation
│   │   │   ├── mainlyout.dart     # Main layout
│   │   │   └── buttumbar.dart     # Bottom navigation bar
│   │   │
│   │   ├── 📁 settings/           # Settings
│   │   ├── 📁 profile/            # Profile
│   │   └── 📁 cart/               # Shopping cart
│   │
│   ├── 📁 widgets/                # Reusable UI components
│   │   └── custom_text_field.dart # Custom text field
│   │
│   └── main.dart                  # Main entry point
│
├── 📁 assets/                     # Assets
│   ├── 📁 images/                 # Images
│   ├── 📁 icons/                  # Icons
│   ├── 📁 lottie/                 # Lottie animations
│   └── 📁 fonts/                  # Fonts
│
├── 📁 test/                       # Unit tests
├── pubspec.yaml                   # Project settings
└── README.md                      # This file
🚀 Getting Started
Prerequisites
Flutter SDK (Version 3.16.0 or higher)

Dart SDK (Version 3.2.0 or higher)

Code Editor (VS Code or Android Studio)

Git for version control

Installation Steps
Clone the repository

bash
git clone https://github.com/yourusername/hadj-delivery.git
cd hadj-delivery
Install dependencies

bash
flutter pub get
Run the application

bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios

# For Web
flutter run -d chrome
Build the application

bash
# Build APK for Android
flutter build apk --release

# Build IPA for iOS
flutter build ipa --release

# Build for Web
flutter build web --release
⚙️ Configuration
1. App Colors (constants/colors.dart)
dart
class AppColors {
  static const Color primary = Color(0xFFFF7F00);     // Main orange
  static const Color secondary = Colors.white;        // White
  static const Color thirdly = Color.fromRGBO(255, 161, 102, 1);
  static const Color background = Colors.white;       // White background
  static const Color cardBackground = Color(0xFFFFF3E0);
  static const Color textPrimary = Colors.black;      // Black text
  static const Color textSecondary = Color(0xFF757575);
}
2. Main Data Models
Store Model (models/store_model.dart)

dart
class StoreModel {
  final String id;              // Unique identifier
  final String name;            // Store name
  final String specialty;       // Specialty
  final String categoryId;      // Category ID
  final String location;        // Location
  final int orderCount;         // Order count
  final double rating;          // Rating
  final bool isOpen;            // Open/closed status
  final double deliveryPrice;   // Delivery price
  final bool isPromoted;        // Is promoted?
  final bool isExclusive;       // Is exclusive?
  final List<String> categories;// Subcategories
}
Item Model (models/item_model.dart)

dart
class ItemModel {
  final String id;              // Item ID
  final String name;            // Item name
  final double price;           // Price
  final String image;           // Item image
  final String category;        // Category
  final bool isPopular;         // Is popular?
  final String description;     // Description
  final String classItemId;     // Section ID
  final String storeId;         // Store ID
  final bool isAvailable;       // Availability
  final int preparationTime;    // Preparation time
}
3. Store Data Manager (models/store_data_manager.dart)
This class manages all store data, items, and sections centrally. It uses a data structure to store:

dart
static final Map<String, Map<String, dynamic>> _storeData = {
  'store_id': {
    'store': StoreModel(...),                    // Store data
    'classItems': [ClassItemModel(...)],         // Store sections
    'items': {                                   // Store items
      'class_item_id': [ItemModel(...)],
    }
  }
};
🏗️ Code Architecture
1. State Management Structure
The app uses StatefulWidget for local state management with Provider for global state management (planned).

dart
// Example: Home page state management
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCategoryId;  // Local state for selected category
  
  void onCategorySelected(String? categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }
}
2. Responsive Design
The app uses MediaQuery and LayoutBuilder to adapt to different screen sizes:

dart
Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  
  return Container(
    constraints: BoxConstraints(maxWidth: screenWidth > 600 ? 440 : double.infinity),
    // ... more code
  );
}
3. Page Navigation
dart
// Navigate to store page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => StorePage(storeId: storeId),
  ),
);

// Navigate with page replacement
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const LoginPage()),
);
📱 Main UI Components
1. Custom App Bar (CustomAppBar)
dart
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Hadj Delivery'),
      centerTitle: true,
      leading: const AppbarLeading(),      // Settings menu
      actions: const [AppbarActions()],    // Profile menu
    );
  }
}
2. Bottom Navigation Bar (CustomBottomNavBar)
dart
CustomBottomNavBar(
  currentIndex: currentIndex,
  items: [
    CustomBottomNavItem(
      icon: Icons.list_alt,
      title: 'Orders',
      onTap: () => setState(() => currentIndex = 0),
    ),
    CustomBottomNavItem(
      icon: Icons.home,
      title: 'Home',
      onTap: () => setState(() => currentIndex = 1),
    ),
    CustomBottomNavItem(
      icon: Icons.shopping_basket,
      title: 'Cart',
      onTap: () => setState(() => currentIndex = 2),
    ),
  ],
)
3. Custom Text Field (CustomTextField)
dart
CustomTextField(
  controller: _phoneController,
  label: 'Phone Number',
  icon: Icons.phone,
  keyboardType: TextInputType.phone,
  validator: (value) => validatePhone(value),
)
🔧 Settings and Customization
1. Changing Colors
Modify the constants/colors.dart file to change app colors.

2. Adding New Categories
dart
// In categorymodel.dart
static List<CategoryModel> getCategories() {
  return [
    // ... existing categories
    CategoryModel(
      id: '12',
      name: 'New Category',
      iconPath: 'assets/images/new_category.png',
    ),
  ];
}
3. Adding New Stores
dart
// In store_data_manager.dart
static final Map<String, Map<String, dynamic>> _storeData = {
  // ... existing stores
  'new_store_id': StoreDataManager.createNewStore(
    id: 'new_store_id',
    name: 'New Store Name',
    specialty: 'Specialty',
    categoryId: '1',
    location: 'Location',
    rating: 4.5,
    // ... more properties
  ),
};
🧪 Testing
Unit Tests
bash
# Run all tests
flutter test

# Run specific test
flutter test test/store_data_manager_test.dart
UI Tests
bash
# Run UI tests
flutter test integration_test/
📊 Performance Analysis
1. Image Optimization
Use precacheImage for preloading images

Use Hero for smooth transitions between pages

Compress images for better performance

2. List Optimization
Use ListView.builder for large lists

Use const for static widgets

Avoid unnecessary widget rebuilds

🚨 Troubleshooting
Common Issue 1: Images Not Visible
Solution: Ensure images are added to pubspec.yaml:

yaml
flutter:
  assets:
    - assets/images/
    - assets/icons/
    - assets/lottie/
Common Issue 2: Arabic Fonts Not Working
Solution: Ensure arabic_font package is added:

yaml
dependencies:
  arabic_font: ^latest_version
Common Issue 3: Slow App Performance
Solution:

Use flutter analyze to detect issues

Use flutter run --profile for performance analysis

Use flutter build apk --analyze-size for size analysis

🔄 Development Workflow
Create new branch

bash
git checkout -b feature/new-feature
Develop new feature

dart
// Develop code following design guidelines
Test changes

bash
flutter test
flutter run --profile
Push changes

bash
git add .
git commit -m "Add new feature: Feature description"
git push origin feature/new-feature
Create Pull Request

📝 Contribution Guide
Code Writing Guidelines
Use clear names for functions and variables

Add explanatory comments for complex code

Follow official Flutter guidelines

Use English for code and comments

Git Guidelines
Use clear commit messages

Split large changes into small commits

Regularly update the main branch

📦 Main Dependencies
Package	Description	Version
flutter	Flutter framework	3.16.0
arabic_font	Arabic fonts	latest
lottie	Animations	latest
carousel_slider	Slider	latest
provider	State management	latest
smooth_page_indicator	Page indicators	latest
📄 License
text
MIT License

Copyright (c) 2024 Hadj Delivery

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
📞 Support and Contact
Email: support@hadjdelivery.com

Website: https://hadjdelivery.com

Twitter: @hadjdelivery

Headquarters: Qais, Algeria

🙏 Acknowledgments
Flutter development team

Algerian tech community

All partner restaurants and stores

Dear users for their trust and support

<div align="center">
Made with ❤️ in Qais, Algeria

https://via.placeholder.com/50/006233/FFFFFF?text=DZ

</div>
