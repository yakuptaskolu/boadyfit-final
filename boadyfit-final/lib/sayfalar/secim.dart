import 'package:firebase_storage/firebase_storage.dart';
import 'package:fitness_app_okul/repo/resimlericek.dart';
import 'package:fitness_app_okul/sabit/renkler.dart';
import 'package:fitness_app_okul/sabit/size.dart';
import 'package:fitness_app_okul/sayfalar/anasayfa.dart';
import 'package:fitness_app_okul/sayfalar/koc.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../model/kayit_model.dart';

// ignore: must_be_immutable
class SecimSayfasi extends StatefulWidget {
  KayitModel kayitModel;
  SecimSayfasi({super.key, required this.kayitModel});

  @override
  State<SecimSayfasi> createState() => _SecimSayfasiState();
}

class _SecimSayfasiState extends State<SecimSayfasi> {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  var url = '';
  Future<void> resimcerk() async {
    url = (await ResimleriCek().bacak('bacak1.png'))!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    resimcerk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: HareketVeEgitmenler(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: RenkManeger.genelRenk,
              ),
              child: Column(
                children: [
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('asset/image/profil.jpg'),
                      maxRadius: 30,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Text(
                      'Yakup TAŞKOLU',
                      style: TextStyle(fontSize: SizeManeger.s20),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Text(
                      widget.kayitModel.mail,
                      style: TextStyle(fontSize: SizeManeger.s16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Mehmet Akif ERSOY Üniversitesi',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text('Bilgisayar Programcılığı'),
                const SizedBox(height: 80),
                Text(
                  widget.kayitModel.dateTime.toString(),
                  style: TextStyle(fontSize: SizeManeger.s16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Column HareketVeEgitmenler() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            Get.to(const AnaSayfa());
          },
          child: Card(
            color: RenkManeger.genelRenk,
            child: Container(
              margin: EdgeInsets.all(SizeManeger.s18),
              height: Get.width / 2,
              child: Center(
                child: Text(
                  'Hareketler',
                  style: TextStyle(fontSize: SizeManeger.s24),
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.to(const KocSayfasi());
          },
          child: Card(
            color: Colors.indigoAccent,
            child: Container(
              margin: EdgeInsets.all(SizeManeger.s18),
              height: Get.width / 2,
              child: Center(
                child: Text(
                  'Eğitmenler',
                  style: TextStyle(fontSize: SizeManeger.s24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
