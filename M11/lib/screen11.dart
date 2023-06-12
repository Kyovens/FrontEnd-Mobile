import 'package:flutter/material.dart';
import 'package:m11/provider.dart';
import 'package:provider/provider.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  bool clear = false;

  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Provider11>(context, listen: false).initialData();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pertemuan11'),
        actions: [showMenuList(context)],
      ),
      body: clear ? Text('Data Tidak ditemukan') : showBody(context),
    );
  }

  showBody(BuildContext context) {
    final prov = Provider.of<Provider11>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else {
      return ListView(
        children: List.generate(prov.data['data']!.length, (index) {
          var item = prov.data['data']![index];
          return Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                title: Text(item['model']),
                isThreeLine: true,
                subtitle: Text('${item['developer']} \n${item['rating']}'),
                trailing: Text(item['price'].toString()),
              ),
              const Divider(),
            ],
          );
        }),
      );
    }
  }

  showMenuList(BuildContext context) {
    final prov = Provider.of<Provider11>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: (() {
                prov.ubahList('hp');
                clear = false;
              }),
              leading: const Icon(Icons.phone),
              title: const Text('Hp'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                prov.ubahList('laptop');
                clear = false;
              },
              leading: const Icon(Icons.laptop),
              title: const Text('Laptop'),
            ),
          ),
          PopupMenuItem(
              child: ListTile(
            onTap: () {
              setState(() {
                clear = true;
              });
            },
            leading: const Icon(Icons.clear),
            title: const Text('Clear'),
          ))
        ];
      },
    );
  }
}
