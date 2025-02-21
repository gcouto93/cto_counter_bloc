import 'package:cto_counter_bloc/aula_5/features/bloc_example/bloc/bloc_freezed_example.dart';
import 'package:cto_counter_bloc/aula_5/features/contacts/list/bloc/register/contact_register_bloc.dart';
import 'package:cto_counter_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactRegisterPage extends StatefulWidget {
  const ContactRegisterPage({super.key});

  @override
  State<ContactRegisterPage> createState() => _ContactRegisterPageState();
}

class _ContactRegisterPageState extends State<ContactRegisterPage> {
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: BlocListener<ContactRegisterBloc, ContactRegisterState>(
        listener: (context, state) {
          state.maybeWhen(
            success: () {
              Navigator.of(context).pop();
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
            },
            orElse: () {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameEC,
                    decoration: const InputDecoration(label: Text('Nome')),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(label: Text('E-mail')),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail é obrigatório';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        final validate = formKey.currentState?.validate() ?? false;
                        if (validate) {
                          context
                              .read<ContactRegisterBloc>()
                              .add(ContactRegisterEvent.save(name: nameEC.text, email: emailEC.text));
                        }
                      },
                      child: Text('Salvar')),
                  Loader<ContactRegisterBloc, ContactRegisterState>(
                    selector: (s) {
                      return s.maybeWhen(loading: () => true, orElse: () => false);
                    },
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
