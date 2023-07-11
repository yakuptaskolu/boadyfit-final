import 'package:fitness_app_okul/repo/yazilaricek.dart';
import 'package:fitness_app_okul/sabit/renkler.dart';
import 'package:fitness_app_okul/sabit/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repo/resimlericek.dart';

// ignore: must_be_immutable
class DetaySayfasi extends StatefulWidget {
  int gelen;
  String gelenbaslik;
  DetaySayfasi({super.key, required this.gelen, required this.gelenbaslik});

  @override
  State<DetaySayfasi> createState() => _DetaySayfasiState();
}

class _DetaySayfasiState extends State<DetaySayfasi> {
  late String url;
  late String? yazi;

  List set = ['3x10', '3x10', '4x12', ' 5x10', '4x10', '2x10', '3x12', '4x10'];

  @override
  void initState() {
    super.initState();
    url = '';
    yazi = '';
    resimleriAl(widget.gelen);
    yazilariAl(widget.gelen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gelenbaslik),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              height: Get.width / 2,
              width: Get.width / 2,
              // ignore: unnecessary_null_comparison
              child: url.isNotEmpty
                  ? Image.network(url)
                  : const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      )),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                set[widget.gelen],
                style: TextStyle(
                  fontSize: SizeManeger.s20,
                  color: RenkManeger.genelRenk,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: RenkManeger.genelRenk,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: yazi != null
                        ? Text(
                            yazi!,
                            style: TextStyle(fontSize: SizeManeger.s20),
                          )
                        : const Text('Veri Bekleniyor'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  resimleriAl(int gelen) async {
    switch (gelen) {
      case 0:
        url = (await ResimleriCek().bacak('gs1.png'))!;

        break;
      case 1:
        url = (await ResimleriCek().bacak('gs2.png'))!;
        break;

      case 2:
        url = (await ResimleriCek().bacak('kol1.png'))!;
        break;

      case 3:
        url = (await ResimleriCek().bacak('kol2.png'))!;
        break;

      case 4:
        url = (await ResimleriCek().bacak('sirt2.png'))!;
        break;

      case 5:
        url = (await ResimleriCek().bacak('sirtbir.png'))!;
        break;

      case 6:
        url = (await ResimleriCek().bacak('bacak1.png'))!;
        break;

      case 7:
        url = (await ResimleriCek().bacak('bacak2.png'))!;
        break;

      default:
        url = (await ResimleriCek().bacak('bacak2.png'))!;
        break;
    }

    setState(() {});
  }

  Future<void> yazilariAl(int gelen) async {
    yazi = await YaziCek().yazi(gelen.toString());
    setState(() {});
  }
}
