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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCDaPhouyTgeu7m987QXUIEOhG1R066jwk',
    appId: '1:530601307395:web:07e75101cb5c375bfecd36',
    messagingSenderId: '530601307395',
    projectId: 'ppdm-fc199',
    authDomain: 'ppdm-fc199.firebaseapp.com',
    storageBucket: 'ppdm-fc199.appspot.com',
    measurementId: 'G-FX1KTGMZVW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfbUBCJBv4e_Wfmj5aqLVk_i7oE7niY14',
    appId: '1:530601307395:android:58cbdcd11afc4446fecd36',
    messagingSenderId: '530601307395',
    projectId: 'ppdm-fc199',
    storageBucket: 'ppdm-fc199.appspot.com',
  );
}
