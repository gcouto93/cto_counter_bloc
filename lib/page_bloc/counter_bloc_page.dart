import 'package:cto_counter_bloc/main.dart';
import 'package:cto_counter_bloc/page_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    // context.read<CounterBloc>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
      ),
      body: Center(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  'Counter ${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterIncrement());
                    },
                    icon: Icon(Icons.add),
                    label: Text('')),
                TextButton.icon(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecrement());
                  },
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
