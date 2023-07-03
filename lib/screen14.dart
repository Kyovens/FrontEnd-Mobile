import 'package:flutter/material.dart';

class Screen14 extends StatefulWidget {
  const Screen14({super.key});

  @override
  State<Screen14> createState() => _Pertemuan14ScreenState();
}

class _Pertemuan14ScreenState extends State<Screen14> {
  DateTime _date = DateTime.now();
  DateTime tanggal1 = DateTime.now();
  TextEditingController? _time;
  DateTimeRange? tanggal;

  int getDaysInBetween() {
    if (tanggal == null) return 0;
    final int difference = tanggal!.end.difference(tanggal!.start).inDays;
    print(difference);
    return difference;
  }

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
        context: context, firstDate: DateTime(1990), lastDate: DateTime(2400));

    if (result != null) {
      setState(() {
        tanggal = result;
      });
      print(result);
    }
  }

  late final items = List<DateTime>.generate(getDaysInBetween(), (i) {
    DateTime date = tanggal?.start ?? DateTime.now();

    return date.add(Duration(days: i));
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan 14'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('Tanggal:'),
                const SizedBox(width: 10),
                Expanded(
                    child: InputDatePickerFormField(
                  initialDate: _date,
                  firstDate: DateTime(1999),
                  lastDate: DateTime(2250),
                  onDateSubmitted: (date) {
                    _date = date;
                    print(_date);
                  },
                )),
                IconButton(
                    onPressed: () async {
                      var res = await showDatePicker(
                          context: context,
                          initialDate: _date,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2500));

                      if (res != null) {
                        setState(() {
                          _date = res;
                        });
                      }
                    },
                    icon: Icon(Icons.date_range))
              ],
            ),
            ListTile(
              title: const Text('Tanggal terpilih'),
              subtitle: Text(_date.toString()),
            ),
            const Divider(),
            Row(
              children: [
                const Text('Jam: '),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  enabled: false,
                  controller: _time,
                  decoration: InputDecoration(labelText: 'Jam'),
                )),
                IconButton(
                    onPressed: () async {
                      var res = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (res != null) {
                        setState(() {
                          _time =
                              TextEditingController(text: res.format(context));
                        });
                      }
                    },
                    icon: Icon(Icons.timer))
              ],
            ),
            Row(
              children: [
                const Text('Tanggal Mulai: '),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InputDatePickerFormField(
                    firstDate: DateTime(1990),
                    lastDate: DateTime(2400),
                    // onDateSubmitted: (_tanggal) {
                    //   setState(() {
                    //     tanggal = _tanggal;
                    //   });
                    // },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      _show();
                    },
                    icon: const Icon(Icons.date_range))
              ],
            ),
            Container(
              child: tanggal == null
                  ? const Text('Masukkan tanggal')
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start date: ${tanggal?.start.day}'),
                            const SizedBox(
                              width: 20,
                            ),
                            Text('End date: ${tanggal?.end.day}'),
                            Container(
                                child: ListView.builder(
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Card(
                                            child: ListTile(
                                              title: Text(
                                                  'Day ${items[index].day}'),
                                              trailing: Text(
                                                  '${items[index].day}/${items[index].month}/${items[index].year}'),
                                            ),
                                          )
                                        ],
                                      );
                                    })),
                          ],
                        ),
                      ),
                    ),
            )
            // ListView(
            //   children: [],
            // )
          ],
        ),
      ),
    );
  }
}
