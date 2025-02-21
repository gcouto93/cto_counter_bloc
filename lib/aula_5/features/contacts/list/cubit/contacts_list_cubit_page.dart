import 'package:cto_counter_bloc/aula_5/features/contacts/list/cubit/contact_list_cubit.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListCubitPage extends StatelessWidget {
  const ContactsListCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/contact/cubit/register');
          context.read<ContactListCubit>().findAll();
        },
      ),
      appBar: AppBar(
        title: const Text('Contact Cubit'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ContactListCubit>().findAll();
        },
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  Loader<ContactListCubit, ContactListCubitState>(
                    selector: (state) {
                      return state.maybeWhen(loading: () => true, orElse: () => false);
                    },
                  ),
                  BlocSelector<ContactListCubit, ContactListCubitState, List<ContactModel>>(
                    selector: (state) {
                      return state.maybeWhen(data: (contacts) => contacts, orElse: () => <ContactModel>[]);
                    },
                    builder: (context, contacts) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return ListTile(
                            onLongPress: () {
                              context.read<ContactListCubit>().deleteByModel(contact);
                            },
                            title: Text(contact.name),
                            subtitle: Text(contact.email),
                            trailing: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushNamed(context, '/contacts/update', arguments: contact);
                              },
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
