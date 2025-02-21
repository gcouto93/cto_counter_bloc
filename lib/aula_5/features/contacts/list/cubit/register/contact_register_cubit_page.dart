import 'package:cto_counter_bloc/aula_5/features/contacts/list/cubit/contact_list_cubit.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactRegisterCubitPage extends StatefulWidget {
  ContactRegisterCubitPage({super.key});

  @override
  State<ContactRegisterCubitPage> createState() => _ContactRegisterCubitPageState();
}

class _ContactRegisterCubitPageState extends State<ContactRegisterCubitPage> {
  final formKey = GlobalKey<FormState>();

  final nameEC = TextEditingController();

  final emailEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Cubit Page'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameEC,
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Nome é obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailEC,
              decoration: const InputDecoration(labelText: 'E-mail'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'E-mail é obrigatório';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ContactListCubit>().create(ContactModel(name: nameEC.text, email: emailEC.text));
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
