import 'package:bloc_test/bloc_test.dart';
import 'package:cto_counter_bloc/aula_5/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockContactRepository extends Mock implements ContactsRepositories {}

void main() {
  //declaracao
  late ContactsRepositories repository;
  late ContactListBloc bloc;
  late List<ContactModel> contacts;

  //preparacao
  setUp(
    () {
      repository = MockContactRepository();
      bloc = ContactListBloc(repository: repository);
      contacts = [
        ContactModel(id: '1', name: 'Fulano', email: ''),
        ContactModel(id: '2', name: 'Ciclano', email: ''),
      ];
    },
  );
  //execucao
  blocTest<ContactListBloc, ContactListState>(
    'deve buscar os contatos',
    build: () => bloc,
    act: (bloc) => bloc.add(ContactListEvent.findAll()),
    setUp: () {
      when(() => repository.findAll()).thenAnswer((_) async => contacts);
    },
    expect: () => [
      ContactListState.loading(),
      ContactListState.data(contacts: contacts),
    ],
  );

  blocTest<ContactListBloc, ContactListState>(
    'deve retornar erro',
    build: () => bloc,
    act: (bloc) => bloc.add(ContactListEvent.findAll()),
    expect: () => [
      ContactListState.loading(),
      ContactListState.error(message: 'Erro ao buscar contatos'),
    ],
  );
}
