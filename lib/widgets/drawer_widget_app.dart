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
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Mobx imc example'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/mobx_page'); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Codegen example'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/contador_codegen'); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Calculadora IMC Mobx'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/contador_imc'); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Observable List Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/observable_list'); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Modelo observado Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/modelo_observado_page'); // Fecha o drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.topic),
            title: const Text('Future Page'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/future_page'); // Fecha o drawer
            },
          ),
        ],
      ),
    );
  }
}
