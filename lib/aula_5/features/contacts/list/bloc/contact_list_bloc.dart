import 'package:bloc/bloc.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';
part 'contact_list_state.dart';
part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactsRepositories _repository;

  ContactListBloc({required ContactsRepositories repository})
      : _repository = repository,
        super(ContactListState.initial());
}
