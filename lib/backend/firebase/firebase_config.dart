import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDoaL3UZFnCEL1hGGfWbJhIuSuREF1b9WI",
            authDomain: "eats-boost-my0f61.firebaseapp.com",
            projectId: "eats-boost-my0f61",
            storageBucket: "eats-boost-my0f61.firebasestorage.app",
            messagingSenderId: "1043345624805",
            appId: "1:1043345624805:web:2901a18b5e723c59868e0c"));
  } else {
    await Firebase.initializeApp();
  }
}
