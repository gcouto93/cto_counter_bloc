import 'package:bloc_test/bloc_test.dart';
import 'package:cto_counter_bloc/aula_5/features/contacts/list/cubit/contact_list_cubit.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactsRepositories extends Mock implements ContactsRepositories {}

void main() {
  //declaracao
  late ContactsRepositories repository;
  late ContactListCubit cubit;
  late List<ContactModel> contacts;

  //preparacao
  setUp(
    () {
      repository = MockContactsRepositories();
      cubit = ContactListCubit(repository: repository);
      contacts = [
        ContactModel(id: '1', name: 'Fulano', email: ''),
        ContactModel(id: '2', name: 'Ciclano', email: ''),
      ];
    },
  );

  //execucao
  blocTest<ContactListCubit, ContactListCubitState>(
    'deve buscar os contatos',
    build: () => cubit,
    act: (cubit) => cubit.findAll(),
    setUp: () {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(contacts: contacts),
    ],
  );
  blocTest<ContactListCubit, ContactListCubitState>(
    'deve deletar um contato',
    build: () => cubit,
    act: (cubit) => cubit.deleteByModel(ContactModel(id: '1', name: 'Fulano', email: '')),
    setUp: () {
      when(() => cubit.deleteByModel(any())).thenAnswer((_) async => {});
      when(() => cubit.findAll()).thenAnswer((_) async => contacts.where((contact) => contact.id != '1').toList());
    },
    expect: () => [
      ContactListCubitState.loading(),
      ContactListCubitState.data(
        contacts: contacts.where((contact) => contact.id != '1').toList(),
      )
    ],
  );
}
