import 'package:fitness_app_okul/model/kayit_model.dart';
import 'package:fitness_app_okul/repo/login_repo.dart';
import 'package:fitness_app_okul/sabit/renkler.dart';
import 'package:fitness_app_okul/sayfalar/giris_sayfasi.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../sabit/mail_textfild.dart';
import '../sabit/sifre_textfild.dart';

class KaydolmaEkrani extends StatefulWidget {
  const KaydolmaEkrani({super.key});

  @override
  State<KaydolmaEkrani> createState() => _KaydolmaEkraniState();
}

class _KaydolmaEkraniState extends State<KaydolmaEkrani> {
  var mailController = TextEditingController();
  var sifreController = TextEditingController();
  var db = DbUser();

  var box = Hive.box<KayitModel>('kaydolmaDB');
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MailTextFild(controller: mailController, label: 'Mail'),
            SifreTextFild(
                controller: sifreController,
                label: 'Sifre : En Az 6 karakter olmalıdır'),
            const SizedBox(height: 15),
            SizedBox(
                width: Get.width / 2,
                child: ElevatedButton(
                    onPressed: () async {
                      if (mailController.text.isNotEmpty &&
                          sifreController.text.isNotEmpty &&
                          sifreController.text.length > 6) {
                        var userGonder = KayitModel(
                            dateTime: date,
                            mail: mailController.text.toString(),
                            sifre: sifreController.text.toString(),
                            id: '00000');

                        var durum = await db.saveUser(userGonder);

                        if (durum == true) {
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const GirisSayfasi(),
                          ));
                        } else {
                          Get.snackbar('Uyarı', 'Geçerli Bİr mail gir',
                              backgroundColor: RenkManeger.genelRenk);
                        }
                      } else {
                        Get.snackbar('Uyarı',
                            'Tüm alanların dolu olduğuna emin olduktan sonrqa tekrar dene.',
                            backgroundColor: RenkManeger.genelRenk);
                      }
                    },
                    child: const Text('Kaydol')))
          ],
        ),
      ),
    );
  }
}
