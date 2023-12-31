import 'package:hive/hive.dart';

part 'kayit_model.g.dart';

@HiveType(typeId: 1)
class KayitModel {
  @HiveField(0)
  String mail;

  @HiveField(1)
  String sifre;
  @HiveField(2)
  String id;
  @HiveField(3)
  DateTime dateTime;

  KayitModel(
      {required this.mail,
      required this.sifre,
      required this.id,
      required this.dateTime});
}
