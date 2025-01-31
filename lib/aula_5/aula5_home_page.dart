import 'package:flutter/material.dart';

class Aula5HomePage extends StatelessWidget {
  const Aula5HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page Aula 5'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0, // Espaço horizontal entre os itens
          runSpacing: 8.0, // Espaço vertical entre as linhas
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          direction: Axis.horizontal,
          children: [
            buttonPattern(context, 'Bloc Example', () {
              Navigator.of(context).pushNamed('/bloc/example');
            }),
            buttonPattern(context, 'Example Freezed', () {
              Navigator.of(context).pushNamed('/bloc/example/freezed');
            }),
            buttonPattern(context, 'Contact', () {}),
            buttonPattern(context, 'Contact Cubit', () {})
          ],
        ),
      ),
    );
  }

  Widget buttonPattern(BuildContext context, String text, VoidCallback func) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 12, // Metade da largura da tela menos o padding
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TextButton(onPressed: func, child: Text(text)),
          ),
        ),
      ),
    );
  }
}
