import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFireBaseConfig {
  static FirebaseOptions get platformOptions {
    if (Platform.isIOS) {
      return const FirebaseOptions(
        apiKey: '',
        appId: '',
        messagingSenderId: '',
        projectId: '',
        iosBundleId: '',
      );
    } else {
      return const FirebaseOptions(
        apiKey: 'AIzaSyDb1zhmyepctH7GHtMBq90Nj013JgihviQ',
        appId: '1:1044714957209:android:cb413d8b20a33190958b08',
        messagingSenderId: '1044714957209',
        projectId: 'scent-18589',
      );
    }
  }
}
