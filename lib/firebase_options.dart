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
    apiKey: 'AIzaSyBG1dO_rxRqtz2vRLh3CKgxH5a98l8XLOc',
    appId: '1:984811166364:web:66169a4d42db7a90f12b59',
    messagingSenderId: '984811166364',
    projectId: 'zfirebaseno',
    authDomain: 'zfirebaseno.firebaseapp.com',
    storageBucket: 'zfirebaseno.appspot.com',
    measurementId: 'G-8T2FTJ7WWX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKKGm3f7teGDUaUnOzN8pDC1gqUe0_Oos',
    appId: '1:984811166364:android:8ee4091e927bf1f7f12b59',
    messagingSenderId: '984811166364',
    projectId: 'zfirebaseno',
    storageBucket: 'zfirebaseno.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWtJoVQIaRCMQPEpSvL6zJWFlCqHadHJo',
    appId: '1:984811166364:ios:134fd393ad8c6f7ef12b59',
    messagingSenderId: '984811166364',
    projectId: 'zfirebaseno',
    storageBucket: 'zfirebaseno.appspot.com',
    iosBundleId: 'com.example.mechat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWtJoVQIaRCMQPEpSvL6zJWFlCqHadHJo',
    appId: '1:984811166364:ios:134fd393ad8c6f7ef12b59',
    messagingSenderId: '984811166364',
    projectId: 'zfirebaseno',
    storageBucket: 'zfirebaseno.appspot.com',
    iosBundleId: 'com.example.mechat',
  );
}
