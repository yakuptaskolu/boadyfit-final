import 'package:flutter/material.dart';

import '../repo/yazilaricek.dart';

class KocDetaySayfasi extends StatefulWidget {
  const KocDetaySayfasi({super.key});

  @override
  State<KocDetaySayfasi> createState() => _KocDetaySayfasiState();
}

class _KocDetaySayfasiState extends State<KocDetaySayfasi> {
  String koc1Url =
      'https://firebasestorage.googleapis.com/v0/b/sporapp-683cf.appspot.com/o/koc2.jpg?alt=media&token=3e923fee-c678-4ae6-8832-ee1b538c4cba';
  String koc2Url =
      'https://firebasestorage.googleapis.com/v0/b/sporapp-683cf.appspot.com/o/koc1.jpg?alt=media&token=91a4f3bf-398d-4115-99af-73f536b2c5ad';

  late String? koc1;
  late String? koc2;

  @override
  void initState() {
    super.initState();
    koc1 = '';
    koc2 = '';
    yaziCek();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Card(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(koc1Url),
                  maxRadius: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color.fromARGB(91, 255, 153, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: koc1 != ''
                        ? Text(koc1!)
                        : const Text('Veri Bekleniyor'),
                  ),
                )
              ],
            )),
            Card(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(koc2Url),
                  maxRadius: 50,
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  color: const Color.fromARGB(91, 255, 153, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: koc1 != ''
                        ? Text(koc1!)
                        : const Text('Veri Bekleniyor'),
                  ),
                )
              ],
            )),
          ],
        )));
  }

  Future<void> yaziCek() async {
    koc1 = await YaziCek().koc('k1');
    koc2 = await YaziCek().koc('k2');
    setState(() {});
  }
}
