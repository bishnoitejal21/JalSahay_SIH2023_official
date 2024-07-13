// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCr69q8aC1Z7PWYkMgFaH-LvyRRVrqs10g',
    appId: '1:353523488170:web:439762fca36b1ea27247d3',
    messagingSenderId: '353523488170',
    projectId: 'jal-sahay-sih',
    authDomain: 'jal-sahay-sih.firebaseapp.com',
    storageBucket: 'jal-sahay-sih.appspot.com',
    measurementId: 'G-TGHC1XR5WN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9vJ5Kuq1V5kgQw6wuKZPF0LvvRQK7eeY',
    appId: '1:353523488170:android:95dcb31210b174b07247d3',
    messagingSenderId: '353523488170',
    projectId: 'jal-sahay-sih',
    storageBucket: 'jal-sahay-sih.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyI8MFxp4CRJv2ahYk7tfEOJOgWSeoDew',
    appId: '1:353523488170:ios:fec16fff7d2719497247d3',
    messagingSenderId: '353523488170',
    projectId: 'jal-sahay-sih',
    storageBucket: 'jal-sahay-sih.appspot.com',
    iosBundleId: 'com.example.jalsahaySih2023',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyI8MFxp4CRJv2ahYk7tfEOJOgWSeoDew',
    appId: '1:353523488170:ios:0ad028bc0a46f9687247d3',
    messagingSenderId: '353523488170',
    projectId: 'jal-sahay-sih',
    storageBucket: 'jal-sahay-sih.appspot.com',
    iosBundleId: 'com.example.jalsahaySih2023.RunnerTests',
  );
}
