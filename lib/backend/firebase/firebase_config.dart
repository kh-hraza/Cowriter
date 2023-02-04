import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAIiHiNecS8tHHTtiKHiNowBZ3mzfd6BXE",
            authDomain: "song-cowriter.firebaseapp.com",
            projectId: "song-cowriter",
            storageBucket: "song-cowriter.appspot.com",
            messagingSenderId: "384891815027",
            appId: "1:384891815027:web:7b6240ef1ab9638c0bd606",
            measurementId: "G-6MMNCD7RKX"));
  } else {
    await Firebase.initializeApp();
  }
}
