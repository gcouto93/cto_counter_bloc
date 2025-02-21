import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_register_state.dart';
part 'contact_register_event.dart';
part 'contact_register_bloc.freezed.dart';

class ContactRegisterBloc extends Bloc<ContactRegisterEvent, ContactRegisterState> {
  ContactsRepositories _contactRepo;

  ContactRegisterBloc({required ContactsRepositories contactRepository})
      : _contactRepo = contactRepository,
        super(ContactRegisterState.initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactRegisterState> emit) async {
    try {
      emit(ContactRegisterState.loading());

      await Future.delayed(Duration(seconds: 2));

      final contactModel = ContactModel(name: event.name, email: event.email);

      await _contactRepo.create(contactModel);
      emit(ContactRegisterState.success());
    } catch (e) {
      emit(ContactRegisterState.error(message: 'Erro ao salvar novo contato'));
    }
  }
}
