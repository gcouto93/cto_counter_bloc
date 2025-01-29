import 'package:flutter/material.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit'),
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter 10',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(onPressed: () {}, icon: Icon(Icons.add), label: Text('')),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.remove),
                  label: Text(''),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
