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
    apiKey: 'AIzaSyC2DAH5xtx1EbJlqxdWDrTl5MkuZfy3rN0',
    appId: '1:592680541295:web:2c9e2c4dcf37d2732e819a',
    messagingSenderId: '592680541295',
    projectId: 'wagwan-7b3a9',
    authDomain: 'wagwan-7b3a9.firebaseapp.com',
    storageBucket: 'wagwan-7b3a9.appspot.com',
    measurementId: 'G-L617P1NFJL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCPwI2yPZ8296_mYjpblgGAGQPs3PCU6pE',
    appId: '1:592680541295:android:e627e783d2abd12f2e819a',
    messagingSenderId: '592680541295',
    projectId: 'wagwan-7b3a9',
    storageBucket: 'wagwan-7b3a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyChXh9tmg93mI49Gvj5y0GqlwJoS4_TF54',
    appId: '1:592680541295:ios:1a4e9988e0ff7f382e819a',
    messagingSenderId: '592680541295',
    projectId: 'wagwan-7b3a9',
    storageBucket: 'wagwan-7b3a9.appspot.com',
    iosClientId: '592680541295-bqjm95e68qhalto65u9pr2hsp2f6808h.apps.googleusercontent.com',
    iosBundleId: 'com.wagwan.wagwan',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyChXh9tmg93mI49Gvj5y0GqlwJoS4_TF54',
    appId: '1:592680541295:ios:1a4e9988e0ff7f382e819a',
    messagingSenderId: '592680541295',
    projectId: 'wagwan-7b3a9',
    storageBucket: 'wagwan-7b3a9.appspot.com',
    iosClientId: '592680541295-bqjm95e68qhalto65u9pr2hsp2f6808h.apps.googleusercontent.com',
    iosBundleId: 'com.wagwan.wagwan',
  );
}