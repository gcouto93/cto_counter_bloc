import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';
part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactsRepositories _repository;

  ContactListBloc({required ContactsRepositories repository})
      : _repository = repository,
        super(ContactListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
    on<_ContactListEventDelete>(_delete);
  }

  Future<void> _findAll(_ContactListEventFindAll event, Emitter<ContactListState> emit) async {
    try {
      emit(ContactListState.loading());
      final contacts = await _repository.findAll();
      await Future.delayed(Duration(seconds: 2));
      // throw Exception('Erro ao buscar contatos');
      emit(ContactListState.data(contacts: contacts));
    } catch (e) {
      emit(ContactListState.error(message: 'Erro ao buscar contatos'));
    }
  }

  FutureOr<void> _delete(event, Emitter<ContactListState> emit) async {
    try {
      emit(ContactListState.loading());
      await _repository.delete(event.model);
      add(ContactListEvent.findAll());
    } on Exception catch (e) {
      emit(ContactListState.error(message: e.toString()));
    }
  }
}
