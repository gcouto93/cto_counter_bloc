import 'package:cto_counter_bloc/aula_5/features/contacts/update/bloc/contact_update_bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactUpdatePage extends StatefulWidget {
  final ContactModel contact;

  const ContactUpdatePage({super.key, required this.contact});

  @override
  State<ContactUpdatePage> createState() => _ContactUpdatePageState();
}

class _ContactUpdatePageState extends State<ContactUpdatePage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController _nameEC;
  late final TextEditingController _emailEC;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEC = TextEditingController(text: widget.contact.name);
    _emailEC = TextEditingController(text: widget.contact.email);
  }

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Update'),
      ),
      body: BlocListener<ContactUpdateBloc, ContactUpdateState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              Navigator.pop(context);
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                message,
                style: TextStyle(color: Colors.white),
              )));
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEC,
                    decoration: const InputDecoration(label: Text('Nome')),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome é obrigatório';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailEC,
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
                          context.read<ContactUpdateBloc>().add(ContactUpdateEvent.save(
                              name: _nameEC.text, email: _emailEC.text, id: widget.contact.id!));
                        }
                      },
                      child: Text('Salvar')),
                  Loader<ContactUpdateBloc, ContactUpdateState>(
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
