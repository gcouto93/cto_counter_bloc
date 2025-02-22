import 'package:cto_counter_bloc/widgets/drawer_widget_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidgetApp(),
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/bloc');
                },
                child: Text(
                  'Bloc',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/cubit');
                },
                child: Text(
                  'Cubit',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
          ],
        ),
      ),
    );
  }
}
