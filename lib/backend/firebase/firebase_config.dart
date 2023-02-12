import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAaFBHkfVA1P9WFxKRWdOPAmZHnhQ-_9DI",
            authDomain: "panditji-c9ec5.firebaseapp.com",
            projectId: "panditji-c9ec5",
            storageBucket: "panditji-c9ec5.appspot.com",
            messagingSenderId: "921249228922",
            appId: "1:921249228922:web:1648624edb86f78cadb3c3",
            measurementId: "G-GTMVDPVDJN"));
  } else {
    await Firebase.initializeApp();
  }
}
