import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:m04/main.dart';
import 'package:intl/intl.dart';

class TodosAddPage extends StatefulWidget {
  TodosAddPage({super.key});

  @override
  State<TodosAddPage> createState() => _TodosAddPageState();
}

List listKegiatan = [];
List listKeterangan = [];
List listTglMulai = [];
List listTglSelesai = [];
List listcategory = [];

class _TodosAddPageState extends State<TodosAddPage> {
  TextEditingController kegiatan = TextEditingController();
  TextEditingController keterangan = TextEditingController();
  TextEditingController tglSelesai = TextEditingController();
  String now = DateFormat('dd-MM-yyyy').format(DateTime.now()).toString();

  bool? isKegiatanEmpty;
  bool? isKeteranganEmpty;
  bool? isTglSelesaiEmpty;

  String selected = 'Routine';

  void addTodos(value1, value2, value3, value4, value5) {
    listKegiatan.add(value1);
    listKeterangan.add(value2);
    listTglMulai.add(value3);
    listTglSelesai.add(value4);
    listcategory.add(value5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('211110870'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Row(children: const [
                        Icon(Icons.list_alt),
                        Padding(padding: EdgeInsets.only(right: 7)),
                        Text(
                          'Kegiatan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ])),
                  Expanded(
                    flex: 6,
                    child: TextFormField(
                      controller: kegiatan,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Judul Kegiatan',
                          errorText: isKegiatanEmpty == true
                              ? 'Judul Kegiatan Harus Diisi'
                              : null),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.sort),
                        Padding(padding: EdgeInsets.only(right: 7)),
                        Text(
                          'Keterangan',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Text(
                  '211110870_Mhd.Reza',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.sort)
              ],
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 30.0),
                      child: TextFormField(
                        controller: keterangan,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Tambah Keterangan',
                            errorText: isKeteranganEmpty == true
                                ? 'Keterangan Harus Diisi'
                                : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                      child: Row(
                    children: const [
                      Icon(Icons.calendar_month),
                      Padding(padding: EdgeInsets.only(right: 7)),
                      Text(
                        'Tanggal Mulai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Row(
                    children: const [
                      Icon(Icons.calendar_month_outlined),
                      Padding(padding: EdgeInsets.only(right: 7)),
                      Text(
                        'Tanggal Selesai',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: now,
                            labelStyle: const TextStyle(fontSize: 14)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        controller: tglSelesai,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(),
                            labelText: '20-03-2022',
                            labelStyle: const TextStyle(fontSize: 14),
                            errorText: isTglSelesaiEmpty == true
                                ? 'Tanggal Selesai Harus Diisi'
                                : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(Icons.category),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Kategory')
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: DropdownButton(
                    icon: const Icon(Icons.keyboard_arrow_down),
                    underline: const SizedBox(),
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value as String;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Routine',
                        child: Text('Routine'),
                      ),
                      DropdownMenuItem(
                        value: 'Work',
                        child: Text('Work'),
                      ),
                      DropdownMenuItem(
                        value: 'Sleep',
                        child: Text('Sleep'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal'),
                  )),
                  const Padding(padding: EdgeInsets.all(5)),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    onPressed: () {
                      if (kegiatan.text.isEmpty) {
                        setState(() {
                          isKegiatanEmpty = true;
                        });
                      }

                      if (keterangan.text.isEmpty) {
                        setState(() {
                          isKeteranganEmpty = true;
                        });
                      }

                      if (tglSelesai.text.isEmpty) {
                        setState(() {
                          isTglSelesaiEmpty = true;
                        });
                      } else {
                        setState(() {
                          isKegiatanEmpty = false;
                          isKeteranganEmpty = false;
                          isTglSelesaiEmpty = false;
                          addTodos(
                              kegiatan.text,
                              keterangan.text,
                              DateFormat('dd-MM-yyyy')
                                      .format(DateTime.now())
                                      .toString() +
                                  " s/d",
                              tglSelesai.text + " s/d",
                              selected);
                        });

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyHomePage(
                            listKegiatan: listKegiatan,
                            listKeterangan: listKeterangan,
                            listTglMulai: listTglMulai,
                            listTglSelesai: listTglSelesai,
                            listcategory: listcategory,
                          );
                        }));
                      }
                    },
                    child: const Text(
                      'Simpan',
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
