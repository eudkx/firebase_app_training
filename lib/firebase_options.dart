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
    apiKey: 'AIzaSyBS-l23jn8KgxQSIm6UXmJ8xcHaANfQCSk',
    appId: '1:82361581274:web:9dba1cfc3aba3306d16fe3',
    messagingSenderId: '82361581274',
    projectId: 'fir-training-d2bfa',
    authDomain: 'fir-training-d2bfa.firebaseapp.com',
    storageBucket: 'fir-training-d2bfa.appspot.com',
    measurementId: 'G-SVRWBJTNHY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMiOik7WzIFH8gXQe5UWjCOslJotB226I',
    appId: '1:82361581274:android:f24ad5186e9de066d16fe3',
    messagingSenderId: '82361581274',
    projectId: 'fir-training-d2bfa',
    storageBucket: 'fir-training-d2bfa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA9MXuPyMf-efpQrDFjM97sx_KYVCLC-zY',
    appId: '1:82361581274:ios:e6833504b1551776d16fe3',
    messagingSenderId: '82361581274',
    projectId: 'fir-training-d2bfa',
    storageBucket: 'fir-training-d2bfa.appspot.com',
    iosBundleId: 'com.example.firebaseAppTraining',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA9MXuPyMf-efpQrDFjM97sx_KYVCLC-zY',
    appId: '1:82361581274:ios:e6833504b1551776d16fe3',
    messagingSenderId: '82361581274',
    projectId: 'fir-training-d2bfa',
    storageBucket: 'fir-training-d2bfa.appspot.com',
    iosBundleId: 'com.example.firebaseAppTraining',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBS-l23jn8KgxQSIm6UXmJ8xcHaANfQCSk',
    appId: '1:82361581274:web:16beac2c4e194b09d16fe3',
    messagingSenderId: '82361581274',
    projectId: 'fir-training-d2bfa',
    authDomain: 'fir-training-d2bfa.firebaseapp.com',
    storageBucket: 'fir-training-d2bfa.appspot.com',
    measurementId: 'G-NCQDX3DYGQ',
  );
}