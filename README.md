# E-commerce App Integration Task  
**Client:** Innerix Technologies LLP  
**Platform:** Flutter (Android-first) + REST API  
**Developer Assessment Task**  

## Project Setup Instructions

### **Prerequisites**
- [Flutter SDK 3.x](https://flutter.dev/docs/get-started/install) installed
- Android Studio or VS Code
- Emulator or physical Android device
- Git installed and configured

### **1. Clone the Repository**
```bash
git clone <your_repository_url>
cd <your_project_folder>
2. Install Dependencies

flutter pub get

3. Run the App

flutter run

4. Build APK

flutter build apk --release

Tech Stack & Architecture Used

Language & Framework: Flutter 3.29.3 (Dart)

Architecture: MVC (Model–View–Controller)

State Management: Provider / ChangeNotifier 

Networking: http package with service layer abstraction

Local Storage: Shared Preferences (for storing access tokens)

Design: Google Fonts + Figma-based UI

Version Control: Git & GitHub

Architecture Overview

lib/
├── controllers/      # ViewModels / Business Logic
├── models/           # Data models for API parsing
├── screens/          # UI Screens (Views)
├── services/         # API service & network helpers
├── widgets/          # Reusable UI components
└── main.dart         # App entry point
Model: Defines data structures (ProductRes)

View: Flutter UI widgets built according to Figma design

Controller: Handles state, API calls, and logic

Service Layer: API integration using clean, reusable methods

Screens Implemented
1. Login Screen
Password Login API:
POST https://app.ecominnerix.com/api/login

OTP-based Login:

Request OTP – POST https://app.ecominnerix.com/api/request-otp

Verify OTP – POST https://app.ecominnerix.com/api/verify-email-otp

On successful login/OTP verification, navigates to Home Screen.

2. OTP Verification Screen
Input field for OTP code

“Verify OTP” button

Static resend code timer placeholder

Email display with “edit email” link (non-functional placeholder)

3. Home Screen
Fetches data from:

Home Data API → GET /api/v1/home

Displays product categories, banners, and products

Placeholder image handling for null/missing values

4. (Optional) Register Screen
Uses POST https://app.ecominnerix.com/api/register

Accepts name, email, password, shop_id, and phone_number

Known Issues
Resend OTP timer is static (no countdown implemented)

Edit email functionality not implemented yet

Minimal API error handling (network timeouts, parsing errors not fully handled)

Currently pre-fills OTP in testing; production should send OTP via email only

Future Improvements
Implement dynamic countdown for OTP resend

Add full edit email functionality

Improve API error handling & retry mechanism

Integrate loaders and empty/error state UIs

OTP auto-fill and stricter validation

Unit testing for API service layer


Deliverables in Repository
Source Code (Flutter project with proper folder structure)

APK File (debug/release build in /build/app/outputs/flutter-apk/)

README.md (this file)

Author
fathima suniya
Flutter Developer
📧 suniyafathima@gmail.com
🔗 GitHub: https://github.com/suniyafathima
