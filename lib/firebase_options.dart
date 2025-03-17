// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDb4JlXqDmSaZqLB8cRJRBi2tFG-Avm8Cs',
    appId: '1:539768346723:web:dc64576288d667c34a4056',
    messagingSenderId: '539768346723',
    projectId: 'chat-app-1384d',
    authDomain: 'chat-app-1384d.firebaseapp.com',
    storageBucket: 'chat-app-1384d.firebasestorage.app',
    measurementId: 'G-19JV7DBT7R',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkAY8zChtz4VZD4niyPLTRUCRAnwWjEc4',
    appId: '1:539768346723:android:b83ad747037a58344a4056',
    messagingSenderId: '539768346723',
    projectId: 'chat-app-1384d',
    storageBucket: 'chat-app-1384d.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC78clhkLBrrMiiUr8g5XjTBCHWKHD3z4Y',
    appId: '1:539768346723:ios:38c30e20ebf751cd4a4056',
    messagingSenderId: '539768346723',
    projectId: 'chat-app-1384d',
    storageBucket: 'chat-app-1384d.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC78clhkLBrrMiiUr8g5XjTBCHWKHD3z4Y',
    appId: '1:539768346723:ios:38c30e20ebf751cd4a4056',
    messagingSenderId: '539768346723',
    projectId: 'chat-app-1384d',
    storageBucket: 'chat-app-1384d.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDb4JlXqDmSaZqLB8cRJRBi2tFG-Avm8Cs',
    appId: '1:539768346723:web:0f5c41905bb587d04a4056',
    messagingSenderId: '539768346723',
    projectId: 'chat-app-1384d',
    authDomain: 'chat-app-1384d.firebaseapp.com',
    storageBucket: 'chat-app-1384d.firebasestorage.app',
    measurementId: 'G-VN70YCWWB1',
  );
}
