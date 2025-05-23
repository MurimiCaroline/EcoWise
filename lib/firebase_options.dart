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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAtFUrVdjgo9gMqUhqUHlbmotRwB0O_nZw',
    appId: '1:1022578629737:ios:93e780e8bf64a7f72d56f8',
    messagingSenderId: '1022578629737',
    projectId: 'ecowise-2972a',
    databaseURL: 'https://ecowise-2972a-default-rtdb.europe-west1.firebasedatabase.app/',
    storageBucket: 'ecowise-2972a.firebasestorage.app',
    iosBundleId: 'com.example.ecoWise',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAtFUrVdjgo9gMqUhqUHlbmotRwB0O_nZw',
    appId: '1:1022578629737:ios:93e780e8bf64a7f72d56f8',
    messagingSenderId: '1022578629737',
    projectId: 'ecowise-2972a',
    databaseURL: 'https://ecowise-2972a-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ecowise-2972a.firebasestorage.app',
    iosBundleId: 'com.example.ecoWise',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCiy6Z0ajtirFAf0paYdNVhGYBQOfqamkk',
    appId: '1:1022578629737:web:176626a05fcec7412d56f8',
    messagingSenderId: '1022578629737',
    projectId: 'ecowise-2972a',
    authDomain: 'ecowise-2972a.firebaseapp.com',
    databaseURL: 'https://ecowise-2972a-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'ecowise-2972a.firebasestorage.app',
    measurementId: 'G-W6VDDTGKJX',
  );
}
