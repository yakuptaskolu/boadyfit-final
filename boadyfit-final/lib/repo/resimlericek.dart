import 'package:firebase_storage/firebase_storage.dart';

class ResimleriCek {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String?> bacak(String istenen) async {
    var yol = firebaseStorage.ref().child(istenen);

    try {
      String url = await yol.getDownloadURL();
      return url;
    } catch (e) {
      return null;
    }
  }
}
