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
    apiKey: 'AIzaSyCVCo5IiVNH39H2Xj1f1JesFrXkITjgzdM',
    appId: '1:775339750345:web:dc15e2a3b61115c29d6e18',
    messagingSenderId: '775339750345',
    projectId: 'log-in-4921e',
    authDomain: 'log-in-4921e.firebaseapp.com',
    storageBucket: 'log-in-4921e.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB-HYepxNGVhjEj_r2Wet3qLUUSrvPJwg8',
    appId: '1:775339750345:android:99c6e44660725b209d6e18',
    messagingSenderId: '775339750345',
    projectId: 'log-in-4921e',
    storageBucket: 'log-in-4921e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO8cqsul3D4rFO4tGm5iZ-pyGs2e8mpws',
    appId: '1:775339750345:ios:8a266ecf4ec736899d6e18',
    messagingSenderId: '775339750345',
    projectId: 'log-in-4921e',
    storageBucket: 'log-in-4921e.appspot.com',
    iosClientId:
        '775339750345-baiqtr7t202d5r8amd2apfoj6lp06a80.apps.googleusercontent.com',
    iosBundleId: 'com.anapact.bletest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO8cqsul3D4rFO4tGm5iZ-pyGs2e8mpws',
    appId: '1:775339750345:ios:06be91355da7ac5c9d6e18',
    messagingSenderId: '775339750345',
    projectId: 'log-in-4921e',
    storageBucket: 'log-in-4921e.appspot.com',
    iosClientId:
        '775339750345-5vnr80htadu1dm4u4ima1uj78o9itcvd.apps.googleusercontent.com',
    iosBundleId: 'com.example.anapact',
  );
}