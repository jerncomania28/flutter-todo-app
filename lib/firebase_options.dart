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
    apiKey: 'AIzaSyCE5jpLikvxPMVoSu0QrEmhc_EIpy1R6M0',
    appId: '1:556324531194:web:b85a1ede1a60a65f5f9243',
    messagingSenderId: '556324531194',
    projectId: 'flutter-todo-app-15d4b',
    authDomain: 'flutter-todo-app-15d4b.firebaseapp.com',
    storageBucket: 'flutter-todo-app-15d4b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSscdRgP_ZaQH3kzilHPhPbIZ7WwzkIbA',
    appId: '1:556324531194:android:b7587d0b19868c895f9243',
    messagingSenderId: '556324531194',
    projectId: 'flutter-todo-app-15d4b',
    storageBucket: 'flutter-todo-app-15d4b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDqf7DXTCXnaw5_phJ70SQ6ipy94Lt1HdU',
    appId: '1:556324531194:ios:0d0db3cd5470f2945f9243',
    messagingSenderId: '556324531194',
    projectId: 'flutter-todo-app-15d4b',
    storageBucket: 'flutter-todo-app-15d4b.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDqf7DXTCXnaw5_phJ70SQ6ipy94Lt1HdU',
    appId: '1:556324531194:ios:0d0db3cd5470f2945f9243',
    messagingSenderId: '556324531194',
    projectId: 'flutter-todo-app-15d4b',
    storageBucket: 'flutter-todo-app-15d4b.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCE5jpLikvxPMVoSu0QrEmhc_EIpy1R6M0',
    appId: '1:556324531194:web:0c77a72cb49419785f9243',
    messagingSenderId: '556324531194',
    projectId: 'flutter-todo-app-15d4b',
    authDomain: 'flutter-todo-app-15d4b.firebaseapp.com',
    storageBucket: 'flutter-todo-app-15d4b.appspot.com',
  );
}
