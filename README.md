# basic_login

This Application reviews the basic ui of sign in and sign up with Firebase


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Firebase setup

1. Login the firebase console or create a firebase account using email
    
- [Firebase console](https://console.firebase.google.com/)

2. Create a new project

    Disable the google analytics for this project


### Add Firebase to your Flutter app

Follow the link and get firebase into your application

- [Add Firebase](https://firebase.google.com/docs/flutter/setup?platform=android)


### Enable sign in methods in firebase authendication

Its in - [Firebase console - Authendication](https://console.firebase.google.com/)

1. Go to sign-in method
2. next click the add new provider button on your right corner
3. select Email/password from Native providers
4. And select Google from Additional providers
    1. If you are using a android platform you need to add the SHA1 fingerprint, the link also provided by itself of the model.


### Google signin 

I am added the Google one tap sign in by achieve this using -[google-sign-in package](https://pub.dev/packages/google_sign_in);

### Firebase Authendication methods

-[Firebase documentaion](https://firebase.google.com/docs/auth/flutter/start)
