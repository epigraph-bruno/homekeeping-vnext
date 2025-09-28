import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      default:
        throw UnsupportedError(
          'Unsupported platform: ${defaultTargetPlatform}',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR-ANDROID-API-KEY',
    appId: 'YOUR-ANDROID-APP-ID',
    messagingSenderId: 'YOUR-SENDER-ID',
    projectId: 'homekeeping-d424c',
    storageBucket: 'homekeeping-d424c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR-IOS-API-KEY',
    appId: 'YOUR-IOS-APP-ID',
    messagingSenderId: 'YOUR-SENDER-ID',
    projectId: 'homekeeping-d424c',
    storageBucket: 'homekeeping-d424c.appspot.com',
    iosClientId: 'YOUR-IOS-CLIENT-ID',
    iosBundleId: 'com.homekeeping.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCbyuwly0yTspLL4zEUmx9ZgCuFDaT4t4M',
    appId: '1:919144048603:web:5f644adf04a71cdd3669fe',
    messagingSenderId: '919144048603',
    projectId: 'homekeeping-d424c',
    authDomain: 'homekeeping-d424c.firebaseapp.com',
    storageBucket: 'homekeeping-d424c.firebasestorage.app',
    measurementId: 'G-XQ823DFRN2',
  );
}
