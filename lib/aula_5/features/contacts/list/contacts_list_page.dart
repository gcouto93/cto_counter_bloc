import 'package:cto_counter_bloc/aula_5/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/contacts/register');
          context.read<ContactListBloc>().add(ContactListEvent.findAll());
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: BlocListener<ContactListBloc, ContactListState>(
        listenWhen: (previous, current) {
          return current.maybeWhen(
            error: (_) => true,
            orElse: () => false,
          );
        },
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                message,
                style: TextStyle(color: Colors.white),
              )));
            },
          );
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ContactListBloc>().add(ContactListEvent.findAll());
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Loader<ContactListBloc, ContactListState>(selector: (state) {
                      return state.maybeWhen(
                        loading: () => true,
                        orElse: () => false,
                      );
                    }),
                    BlocSelector<ContactListBloc, ContactListState, List<ContactModel>>(
                      builder: (context, contacts) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(contacts[index].name),
                              subtitle: Text(contacts[index].email),
                              onTap: () async {
                                await Navigator.pushNamed(context, '/contacts/update', arguments: contacts[index]);
                                context.read<ContactListBloc>().add(ContactListEvent.findAll());
                              },
                              onLongPress: () async {
                                context.read<ContactListBloc>().add(ContactListEvent.delete(model: contacts[index]));
                                context.read<ContactListBloc>().add(ContactListEvent.findAll());
                              },
                            );
                          },
                        );
                      },
                      selector: (ContactListState state) {
                        return state.maybeWhen(orElse: () => [], data: (contacts) => contacts);
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
