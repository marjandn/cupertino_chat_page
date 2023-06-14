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
    apiKey: 'AIzaSyDKK2yZhaXyXX2pGHuguXc9_i_uGDPhrE4',
    appId: '1:676761734125:web:7290b9196e1f04acf1b5e4',
    messagingSenderId: '676761734125',
    projectId: 'chatapp-cbc35',
    authDomain: 'chatapp-cbc35.firebaseapp.com',
    databaseURL: 'https://chatapp-cbc35-default-rtdb.firebaseio.com',
    storageBucket: 'chatapp-cbc35.appspot.com',
    measurementId: 'G-E6C6WJ95ZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBon_syZXKAv5Uu7l1DoSa_NcsZgBy55CY',
    appId: '1:676761734125:android:a6275c1966ffff6af1b5e4',
    messagingSenderId: '676761734125',
    projectId: 'chatapp-cbc35',
    databaseURL: 'https://chatapp-cbc35-default-rtdb.firebaseio.com',
    storageBucket: 'chatapp-cbc35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3oyDaT6tBUTqhyR6YgYpvWbN6P4Kv68s',
    appId: '1:676761734125:ios:9df69b37216e765df1b5e4',
    messagingSenderId: '676761734125',
    projectId: 'chatapp-cbc35',
    databaseURL: 'https://chatapp-cbc35-default-rtdb.firebaseio.com',
    storageBucket: 'chatapp-cbc35.appspot.com',
    iosClientId: '676761734125-t725138fhp7no4b44bseda7p779rs7q5.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseDbImessage',
  );
}
