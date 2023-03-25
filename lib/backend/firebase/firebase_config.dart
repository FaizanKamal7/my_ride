import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBAdeI1GITrMTHzndOwzKecdo9zbNFVNg4",
            authDomain: "myride-87f75.firebaseapp.com",
            projectId: "myride-87f75",
            storageBucket: "myride-87f75.appspot.com",
            messagingSenderId: "347985680587",
            appId: "1:347985680587:web:4ab22a90eb7bc0bc76634e"));
  } else {
    await Firebase.initializeApp();
  }
}
