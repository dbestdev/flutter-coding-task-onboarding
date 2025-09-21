# Flutter Coding Task - Onboarding Screen

[![GitHub](https://img.shields.io/badge/GitHub-Repository-blue?style=flat-square&logo=github)](https://github.com/dbestdev/flutter-coding-task-onboarding)
[![Flutter](https://img.shields.io/badge/Flutter-3.32.8-blue?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.8.1-blue?style=flat-square&logo=dart)](https://dart.dev)

## 📱 Project Overview

This project implements a mobile onboarding screen based on the provided Figma design. The implementation focuses on UI fidelity, responsive design, and Flutter best practices.

**🔗 Repository**: [https://github.com/dbestdev/flutter-coding-task-onboarding](https://github.com/dbestdev/flutter-coding-task-onboarding)

## 🎯 Task Requirements Met

- ✅ **Flutter Stable**: Using Flutter 3.32.8 (stable channel)
- ✅ **No Third-party UI Kits**: Only Material Design components used
- ✅ **ThemeData Implementation**: Comprehensive theme with color tokens and text styles
- ✅ **Responsive Design**: Optimized for 360×800 and 390×844 screen sizes
- ✅ **UI Fidelity**: Pixel-perfect implementation matching Figma design

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK 3.32.8 or later
- Dart 3.8.1 or later
- iOS Simulator or Android Emulator
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/dbestdev/flutter-coding-task-onboarding.git
   cd flutter-coding-task-onboarding
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Platform-specific Setup

#### iOS
- Ensure Xcode is installed
- Run `flutter run` and select iOS simulator or device

#### Android
- Ensure Android Studio is installed
- Run `flutter run` and select Android emulator or device

## 🏗️ Project Structure

```
lib/
├── main.dart                    # App entry point
├── screens/
│   └── onboarding_screen.dart   # Main onboarding screen implementation
└── theme/
    └── app_theme.dart          # Comprehensive theme configuration

assets/
├── images/
│   ├── background.png          # Background image
│   └── google.png             # Google logo for button
└── icons/                      # Additional icons (if needed)
```

## 🎨 Design Implementation

### Key Features
- **Background Image**: Full-screen background with proper alignment
- **Gradient Overlay**: Linear gradient from transparent to black
- **Language Dropdown**: Interactive modal with language selection
- **Action Buttons**: Three authentication options (Apple ID, Google, Email)
- **Terms & Conditions**: Legal text with proper styling

### Color Scheme
- **Primary Purple**: #5925DC (Apple ID button)
- **Secondary Blue**: #2E90FA (Google button)
- **Brand Purple**: #2C0A84 (text on light backgrounds)
- **White**: #FFFFFF (text on dark backgrounds)
- **Transparent**: #00000000 (gradient start)

### Typography
- **Font Family**: Aeonik (as specified in design)
- **Title**: 32px, Bold, White text
- **Button Text**: 15px, Regular, White text
- **Terms Text**: 12px, Regular, White text
- **Modal Text**: 15px, Regular/Medium, Purple text

## 📐 Responsive Design

The implementation is optimized for the specified screen sizes:
- **360×800**: iPhone SE, smaller Android devices
- **390×844**: iPhone 12/13/14 standard size

### Responsive Features
- Fixed positioning for language dropdown
- Proper spacing and padding for different screen sizes
- Text scaling and button sizing
- Modal sizing and positioning

## 🔧 Technical Implementation

### Architecture
- **StatefulWidget**: Used for interactive language selection
- **Stack Layout**: Layered background image and gradient
- **Positioned Widgets**: Precise placement of UI elements
- **Modal Bottom Sheet**: Language selection interface

### Theme System
- **Centralized Colors**: All colors defined in AppTheme
- **Text Styles**: Reusable text styles for consistency
- **Material Design**: Following Material Design principles
- **Custom Styling**: Brand-specific colors and typography

### State Management
- **Local State**: Language selection state
- **Modal State**: Independent state for language modal
- **StatefulBuilder**: For modal state updates

## 📱 Screenshots

*Screenshots comparing the implementation with the Figma design will be provided separately*

## ⏱️ Development Time

- **Total Time**: Approximately 4-6 hours
- **UI Implementation**: 2-3 hours
- **Theme Refactoring**: 1 hour
- **Testing & Polish**: 1-2 hours

## 🧪 Testing

### Tested On
- ✅ iPhone (Physical device)
- ✅ iOS Simulator
- ✅ Android Emulator
- ✅ Multiple screen sizes (360×800, 390×844)

### Test Scenarios
- ✅ Language dropdown functionality
- ✅ Modal interactions
- ✅ Button tap responses
- ✅ Responsive layout
- ✅ Image loading and display

## 📋 Assumptions

1. **Font Loading**: Aeonik font is assumed to be available (can be added to pubspec.yaml if needed)
2. **Image Assets**: Background and Google logo images are provided
3. **Screen Sizes**: Focus on 360×800 and 390×844 as primary targets
4. **Functionality**: Buttons are for UI demonstration (no actual authentication)

