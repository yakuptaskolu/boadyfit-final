import 'package:firebase_auth/firebase_auth.dart';

import '../model/kayit_model.dart';

class DbUser {
  final FirebaseAuth db = FirebaseAuth.instance;

  Future<bool> saveUser(KayitModel userModel) async {
    try {
      var user = await db.createUserWithEmailAndPassword(
          email: userModel.mail, password: userModel.sifre);

      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // Kullanıcı giriş işlemini gerçekleştirme
  Future<UserCredential?> checkUser(String email, String password) async {
    try {
      UserCredential userCredential = await db.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
      // Giriş başarılı olduysa, kullanıcı Credential bilgilerine erişebilirsiniz:
      // userCredential.user.uid, userCredential.user.email vb.
    } catch (e) {
      // Hata durumunda hata mesajını işleyin
      return null;
    }
  }
}
