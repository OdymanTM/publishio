import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD6WHooiELvm48SGzY8tGbOpdA1sIguKlY",
            authDomain: "publishio.firebaseapp.com",
            projectId: "publishio",
            storageBucket: "publishio.appspot.com",
            messagingSenderId: "369577116365",
            appId: "1:369577116365:web:a1c349e8e8b8972a3b1f84",
            measurementId: "G-DS2H7M7JW7"));
  } else {
    await Firebase.initializeApp();
  }
}
