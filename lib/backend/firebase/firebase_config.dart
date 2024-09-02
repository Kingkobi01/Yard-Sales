import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyB0l_17mz0RPRi-Sh7vM8GZQ1rutUG5NYM",
            authDomain: "yard-sales-1386b.firebaseapp.com",
            projectId: "yard-sales-1386b",
            storageBucket: "yard-sales-1386b.appspot.com",
            messagingSenderId: "1064585625477",
            appId: "1:1064585625477:web:f2b96608fc7ea3e8518eec",
            measurementId: "G-XB2JEJ3XT1"));
  } else {
    await Firebase.initializeApp();
  }
}
