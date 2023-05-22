import 'package:flutter/material.dart';
import 'package:m09/Inbox.dart';

class Screen09 extends StatefulWidget {
  const Screen09({super.key});

  @override
  State<Screen09> createState() => _Screen09State();
}

class _Screen09State extends State<Screen09> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pertemuan 09",
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.purple),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/img1.webp'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Reza',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'reza@gmail.com',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Inbox(),
                  ),
                );
              },
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.save),
              title: Text('Archived'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.download),
              title: Text('Saved'),
            ),
          ],
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
            child: TextButton(
          onPressed: () {
            showBottomSheet(
                enableDrag: true,
                context: context,
                builder: (context) {
                  final theme = Theme.of(context);
                  return Wrap(
                    children: [
                      ListTile(
                        title: Text(
                          'Header',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        tileColor: theme.colorScheme.primary,
                        trailing: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ),
                      ListTile(
                        title: Text('Facebook'),
                      ),
                      ListTile(
                        title: Text('Twitter'),
                      )
                    ],
                  );
                });
          },
          child: Text('Menu'),
        ));
      }),
    );
  }
}
