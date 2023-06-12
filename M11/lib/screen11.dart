import 'dart:html';

import 'package:flutter/material.dart';
import 'package:m11/provider11.dart';
import 'package:provider/provider.dart';

class Screen11 extends StatefulWidget {
  const Screen11({super.key});

  @override
  State<Screen11> createState() => _Screen11State();
}

class _Screen11State extends State<Screen11> {
  @override
  void iniState() {
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
      body: showBody(context),
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
              leading: CircleAvatar(backgroundImage: NetworkImage(item['img'])),
              title: Text(item['model']),
              trailing: Text(item['price'].toString()),
            ),
            const Divider(),
          ],
        );
      }));
    }
  }

  showMenuList(BuildContext context) {
    final prov = Provider.of<Provider11>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('hp'),
              leading: const Icon(Icons.phone),
              title: const Text('HP'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('laptop'),
              leading: const Icon(Icons.laptop),
              title: const Text('Laptop'),
            ),
          )
        ];
      },
    );
  }
}
