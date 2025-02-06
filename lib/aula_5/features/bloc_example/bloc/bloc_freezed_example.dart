import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/bloc_freezed/example_freezed_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocFreezedExample extends StatelessWidget {
  const BlocFreezedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example freezed'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ExampleFreezedBloc>().add(ExampleFreezedEvent.addName('Novo nome freezes'));
        },
      ),
      body: BlocListener<ExampleFreezedBloc, ExampleFreezedState>(
        listener: (context, state) {
          state.whenOrNull(showBanner: (_, message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          });
        },
        child: Column(
          children: [
            BlocSelector<ExampleFreezedBloc, ExampleFreezedState, bool>(
              selector: (state) {
                return state.maybeWhen(loading: () => true, orElse: () => false);
              },
              builder: (context, state) {
                if (state) {
                  return const Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  ));
                }
                return const SizedBox.shrink();
              },
            ),
            BlocSelector<ExampleFreezedBloc, ExampleFreezedState, List<String>>(
              selector: (state) {
                return state.maybeWhen(
                    data: (names) => names, showBanner: (names, _) => names, orElse: () => <String>[]);
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final name = state[index];
                    return ListTile(
                      title: Text(name),
                      onTap: () {},
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
