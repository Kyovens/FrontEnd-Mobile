import 'package:flutter/material.dart';
import 'package:m05/M05_provider.dart';
import 'package:provider/provider.dart';

class Screen05 extends StatefulWidget {
  const Screen05({super.key});

  @override
  State<Screen05> createState() => _Screen05State();
}

class _Screen05State extends State<Screen05> {
  bool? soal1a = false;
  bool? soal1b = false;

  String soal2 = 'answ';

  bool kelasPagi = false;
  bool kelasSiang = false;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Provider05>(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut ..'),
              Row(
                children: [
                  Text('a.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: soal1a,
                    onChanged: (val) {
                      setState(() {
                        soal1a = val;
                      });
                    },
                  ),
                  const Text('RAM'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Checkbox(
                    value: soal1b,
                    onChanged: (val) {
                      setState(() {
                        soal1b = val;
                      });
                    },
                  ),
                  const Text('Random Access Memory')
                ],
              ),
              if (soal1a == false && soal1b == false)
                Container()
              else if (soal1a == true && soal1b == true)
                const Text(
                  'Ini Benar',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Ini Salah',
                  style: TextStyle(color: Colors.red),
                ),
              const Divider(),
              const Text('2. Skema desain pembangunan jaringan di sebut..'),
              Row(
                children: [
                  const Text('a.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: 'topologi',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'topologi';
                      });
                    },
                  ),
                  const Text('Topologi'),
                ],
              ),
              Row(
                children: [
                  const Text('b.'),
                  const SizedBox(
                    width: 5,
                  ),
                  Radio(
                    value: 'desain jaringan',
                    groupValue: soal2,
                    onChanged: (val) {
                      setState(() {
                        soal2 = 'desain jaringan';
                      });
                    },
                  ),
                  const Text('Desain Jaringan'),
                ],
              ),
              if (soal2 == 'answ')
                Container()
              else if (soal2 == 'desain jaringan')
                const Text(
                  'Ini Benar',
                  style: TextStyle(color: Colors.green),
                )
              else
                const Text(
                  'Ini Salah',
                  style: TextStyle(color: Colors.red),
                ),
              const Divider(),
              const Text('Feedback Soal, '),
              const SizedBox(
                width: 10,
                height: 10,
              ),
              const Text('Kelas'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('Pagi'),
                    selected: kelasPagi,
                    selectedColor: Colors.blue[200],
                    onSelected: (val) {
                      setState(() {
                        kelasPagi = val;
                        kelasSiang = false;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ChoiceChip(
                    label: const Text('Siang'),
                    selectedColor: Colors.blue[200],
                    selected: kelasSiang,
                    onSelected: (val) {
                      setState(() {
                        kelasPagi = false;
                        kelasSiang = val;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Soal di atas telah dipelajari saat?'),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  FilterChip(
                    label: const Text('Sekolah'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusSekolah,
                    onSelected: (val) {
                      prov.setSekolah = val;
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FilterChip(
                    label: const Text('Praktikum'),
                    selectedColor: Colors.blue[200],
                    selected: prov.statusPraktik,
                    onSelected: (val) {
                      prov.setPraktik = val;
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  FilterChip(
                      label: const Text('Kursus'),
                      selectedColor: Colors.blue[200],
                      selected: prov.statusKursus,
                      onSelected: (val) {
                        prov.setKursus = val;
                      })
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Peminatan saat sekolah?'),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(prov.pilihPeminatan.join(' , ')),
                ),
                // Padding(
                //   padding: EdgeInsets.all(5),
                //   child: Text('${prov.pilihPeminatan.join('')}'),
                // )
              ]),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InputChip(
                    label: const Text('TKJ'),
                    selectedColor: Colors.blue,
                    selected: prov.pilihPeminatan.contains('TKJ'),
                    onSelected: (val) {
                      prov.togglePeminatan('TKJ');
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InputChip(
                    selectedColor: Colors.blue,
                    selected: prov.pilihPeminatan.contains('RPL'),
                    label: const Text('RPL'),
                    onSelected: (val) {
                      prov.togglePeminatan('RPL');
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InputChip(
                    label: const Text('SMA'),
                    selectedColor: Colors.blue,
                    selected: prov.pilihPeminatan.contains('SMA'),
                    onSelected: (val) {
                      prov.togglePeminatan('SMA');
                    },
                    // onPressed: () {},
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
