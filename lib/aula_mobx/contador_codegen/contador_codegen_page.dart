import 'package:cto_counter_bloc/aula_mobx/contador_codegen/contador_codege_controller.dart';
import 'package:cto_counter_bloc/aula_mobx/mobx_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ContadorCodegenPage extends StatefulWidget {
  final controller = ContadorCodegeController();
  final reactionDisposer = <ReactionDisposer>[];

  ContadorCodegenPage({super.key});

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  @override
  void initState() {
    super.initState();
    final autorunDisposer = autorun((_) {
      print('Autorun: ${widget.controller.saudacao}');
    });
    final reactionDisposer = reaction((_) => widget.controller.contador, (counter) {
      print('Reaction: ${widget.controller.contador}----------------------------------');
    });

    final whenDisposer = when((_) => widget.controller.fullName.first == 'Muluke', () {
      print('---------------------------------- WHEN ---------------------------------- ');
      print(widget.controller.fullName.first);
    });

    widget.reactionDisposer.add(autorunDisposer);
    widget.reactionDisposer.add(reactionDisposer);
    widget.reactionDisposer.add(whenDisposer);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.reactionDisposer.forEach((element) {
      element();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador codegen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (_) {
              return Text(
                'Voce apertou o botao ${widget.controller.contador} vezes',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Observer(builder: (_) {
              return Text(
                'First Name: ${widget.controller.fullName.first} ',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Observer(builder: (_) {
              return Text(
                'Last Name:  ${widget.controller.fullName.last} ',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Observer(builder: (_) {
              return Text(
                'Olá:  ${widget.controller.saudacao} ',
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            TextButton(
                onPressed: () {
                  widget.controller.changeName();
                },
                child: Text('Mudar nome')),
            TextButton(
                onPressed: () {
                  widget.controller.roolBackName();
                },
                child: Text('RollBack nome'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.controller.incrementar();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
