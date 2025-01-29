import 'package:flutter/material.dart';

class DrawerWidgetApp extends StatelessWidget {
  const DrawerWidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Selecione um conteúdo abaixo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Bloc aula 5'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/aula5'); // Fecha o drawer
            },
          ),
        ],
      ),
    );
  }
}
