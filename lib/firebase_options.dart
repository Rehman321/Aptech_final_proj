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
    apiKey: 'AIzaSyAsag8wyNL9WX13S1I7DGfEdRL_Q1A7fqk',
    appId: '1:607871518318:web:4c530f55410d48a7b1887f',
    messagingSenderId: '607871518318',
    projectId: 'final-proj-31854',
    authDomain: 'final-proj-31854.firebaseapp.com',
    storageBucket: 'final-proj-31854.appspot.com',
    measurementId: 'G-J0BEQQBCV7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUQGorr_CFAS4YiZ4uiivyvxm6PpdWMmk',
    appId: '1:607871518318:android:8ee065324899122fb1887f',
    messagingSenderId: '607871518318',
    projectId: 'final-proj-31854',
    storageBucket: 'final-proj-31854.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAFTaSkm8eSry_MG4CqflNuCrvnMARlEcc',
    appId: '1:607871518318:ios:bb4530ddb9e46595b1887f',
    messagingSenderId: '607871518318',
    projectId: 'final-proj-31854',
    storageBucket: 'final-proj-31854.appspot.com',
    iosBundleId: 'com.example.finalProj',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAFTaSkm8eSry_MG4CqflNuCrvnMARlEcc',
    appId: '1:607871518318:ios:3499883ec560408db1887f',
    messagingSenderId: '607871518318',
    projectId: 'final-proj-31854',
    storageBucket: 'final-proj-31854.appspot.com',
    iosBundleId: 'com.example.finalProj.RunnerTests',
  );
}
