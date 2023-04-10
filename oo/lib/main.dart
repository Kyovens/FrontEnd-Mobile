import 'package:flutter/material.dart';
import 'package:m04/todos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todos',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        listKegiatan: [],
        listKeterangan: [],
        listTglMulai: [],
        listTglSelesai: [],
        listcategory: [],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
      required this.listKegiatan,
      required this.listKeterangan,
      required this.listTglMulai,
      required this.listTglSelesai,
      required this.listcategory});

  final List listKegiatan;
  final List listKeterangan;
  final List listTglMulai;
  final List listTglSelesai;
  final List listcategory;

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: listKegiatan.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, right: 15.0, left: 10.0),
              child: Column(
                children: [
                  Container(
                      child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 50,
                          height: 50,
                          child: Stack(children: [
                            Center(
                              child: Icon(
                                Icons.circle,
                                size: 50,
                                color: Colors.purple[700],
                              ),
                            ),
                            Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listKegiatan[index],
                              style: const TextStyle(
                                fontSize: 19,
                              ),
                            ),
                            Text(
                              listKeterangan[index],
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.blue,
                              ),
                              child: Text(
                                listcategory[index],
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              listTglMulai[index],
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              listTglSelesai[index],
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodosAddPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
