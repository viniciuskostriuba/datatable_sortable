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
    apiKey: 'AIzaSyDBI29g9ocY5QIqdYNLbtseE5ch5EmynFQ',
    appId: '1:973057517228:web:90a4d4efd07b7c6c1d6109',
    messagingSenderId: '973057517228',
    projectId: 'datatable-a1011',
    authDomain: 'datatable-a1011.firebaseapp.com',
    storageBucket: 'datatable-a1011.appspot.com',
    measurementId: 'G-JQGEGWCJLZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAHoO9zJmc4XXap0ifkg8cElHP0GF--4Lk',
    appId: '1:973057517228:android:9b8339d7920178511d6109',
    messagingSenderId: '973057517228',
    projectId: 'datatable-a1011',
    storageBucket: 'datatable-a1011.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBXcz-sLESye5yTg9ihj6SvqKKlLFqeoBA',
    appId: '1:973057517228:ios:8b50ba0cd2c3827f1d6109',
    messagingSenderId: '973057517228',
    projectId: 'datatable-a1011',
    storageBucket: 'datatable-a1011.appspot.com',
    iosClientId: '973057517228-67p403s5agvuqv410c07se9h2plfcupa.apps.googleusercontent.com',
    iosBundleId: 'com.example.datatableSortableExample',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBXcz-sLESye5yTg9ihj6SvqKKlLFqeoBA',
    appId: '1:973057517228:ios:8b50ba0cd2c3827f1d6109',
    messagingSenderId: '973057517228',
    projectId: 'datatable-a1011',
    storageBucket: 'datatable-a1011.appspot.com',
    iosClientId: '973057517228-67p403s5agvuqv410c07se9h2plfcupa.apps.googleusercontent.com',
    iosBundleId: 'com.example.datatableSortableExample',
  );
}
