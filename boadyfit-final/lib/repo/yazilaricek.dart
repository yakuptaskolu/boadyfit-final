import 'package:cloud_firestore/cloud_firestore.dart';

class YaziCek {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<String?> yazi(String istenen) async {
    try {
      var yol = await db.collection('lessons').doc(istenen).get();

      String? yazi = yol.data()?.values.toString();
      return yazi;
    } catch (e) {
      return null;
    }
  }

  Future<String?> koc(String istenen) async {
    try {
      var yol = await db.collection('koc').doc(istenen).get();

      String? yazi = yol.data()?.values.toString();
      return yazi;
    } catch (e) {
      return null;
    }
  }
}
