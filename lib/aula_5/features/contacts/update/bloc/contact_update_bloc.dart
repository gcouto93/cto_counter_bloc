import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_update_event.dart';
part 'contact_update_state.dart';
part 'contact_update_bloc.freezed.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState> {
  ContactsRepositories _contactRepo;

  ContactUpdateBloc({required ContactsRepositories contactRepo})
      : _contactRepo = contactRepo,
        super(ContactUpdateState.initial()) {
    on<_Save>(_save);
  }

  FutureOr<void> _save(_Save event, Emitter<ContactUpdateState> emit) async {
    try {
      emit(ContactUpdateState.loading());

      final model = ContactModel(
        id: event.id,
        name: event.name,
        email: event.email,
      );

      await _contactRepo.update(model);
      emit(ContactUpdateState.success());
    } catch (e, s) {
      emit(ContactUpdateState.error(message: 'Erro ao atualizar contato'));
    }
  }
}
