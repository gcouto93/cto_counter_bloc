import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/example_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
      ),
      body: BlocListener<ExampleBloc, ExampleState>(
        listenWhen: (previous, current) {
          if (previous is ExampleStateInitial && current is ExampleStateData) {
            if (current.names.length > 3) {
              return true;
            }
          }
          return false;
        },
        listener: (context, state) {
          if (state is ExampleStateData) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('A quantidade de nomes é ${state.names.length}')));
          }
        },
        child: Column(
          children: [
            BlocConsumer<ExampleBloc, ExampleState>(
              builder: (context, state) {
                if (state is ExampleStateData) {
                  return Text('Total de nomes é ${state.names.length}');
                } else {
                  return const SizedBox.shrink();
                }
              },
              listener: (context, state) {
                print('Estado alterado para ${state.runtimeType}');
              },
            ),
            BlocSelector<ExampleBloc, ExampleState, bool>(
              selector: (state) {
                if (state is ExampleStateInitial) {
                  return true;
                }
                return false;
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
            BlocSelector<ExampleBloc, ExampleState, List<String>>(
              selector: (state) {
                if (state is ExampleStateData) {
                  return state.names;
                }
                return [];
              },
              builder: (context, names) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: names.length,
                  itemBuilder: (context, index) {
                    final name = names[index];
                    return ListTile(
                      onTap: () {
                        context.read<ExampleBloc>().add(ExampleRemoveNameEvent(name: name));
                      },
                      title: Text(name),
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _controller,
              onSaved: (newValue) {},
            ),
            Card(
              color: Colors.amber.shade300,
              elevation: 10,
              child: TextButton(
                  onPressed: () {
                    context.read<ExampleBloc>().add(ExampleAddNameEvent(name: _controller.text));
                  },
                  child: Text('Add item na lista')),
            )
          ],
        ),
      ),
    );
  }
}
