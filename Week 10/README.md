# Week 10

This folder contains the Week 10 Flutter workshop project. It extends the travel expenses app with Firebase authentication.

## What It Includes

- Firebase initialization through `firebase_options.dart`
- Login and registration UI
- Firebase Authentication sign-in and account creation
- An auth gate that switches between the auth screen and expenses app
- Provider-managed expense state
- Light and dark Material 3 themes

## Main Files

- `lib/main.dart`: Firebase setup, app theme, provider setup, and auth gate
- `lib/auth_screen.dart`: login/register form and Firebase auth calls
- `lib/firebase_options.dart`: generated Firebase configuration
- `lib/expenses.dart`: authenticated expenses screen
- `lib/models/expenses_state.dart`: shared expense state
