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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAj-aX64KS3lkQJA2_PSTxGwKSbGtPKMro',
    appId: '1:678216779539:web:dcaaf8cb39f8154953bce6',
    messagingSenderId: '678216779539',
    projectId: 'finder-310f0',
    authDomain: 'finder-310f0.firebaseapp.com',
    storageBucket: 'finder-310f0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB8SrLqB6-ZpoGkfABCeID612ZKMdJgIrY',
    appId: '1:678216779539:ios:def7a6ae397ab17e53bce6',
    messagingSenderId: '678216779539',
    projectId: 'finder-310f0',
    storageBucket: 'finder-310f0.appspot.com',
    iosBundleId: 'com.finder.app.finder',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB8SrLqB6-ZpoGkfABCeID612ZKMdJgIrY',
    appId: '1:678216779539:ios:d4a06dd46e58418d53bce6',
    messagingSenderId: '678216779539',
    projectId: 'finder-310f0',
    storageBucket: 'finder-310f0.appspot.com',
    iosBundleId: 'com.finder.app.finder.RunnerTests',
  );
}
