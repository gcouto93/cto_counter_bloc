import 'package:bloc/bloc.dart';
import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:cto_counter_bloc/repostories/contacts_repositories.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_cubit_state.dart';
part 'contact_list_cubit.freezed.dart';

class ContactListCubit extends Cubit<ContactListCubitState> {
  final ContactsRepositories _repository;

  ContactListCubit({required ContactsRepositories repository})
      : _repository = repository,
        super(ContactListCubitState.inital());

  Future<void> findAll() async {
    emit(ContactListCubitState.loading());
    try {
      final contacts = await _repository.findAll();
      await Future.delayed(Duration(seconds: 2));
      emit(ContactListCubitState.data(contacts: contacts));
    } catch (e) {
      emit(ContactListCubitState.error(message: 'Erro ao buscar contatos'));
    }
  }

  Future<void> deleteByModel(ContactModel model) async {
    emit(ContactListCubitState.loading());
    await _repository.delete(model);
    findAll();
  }

  Future<void> create(ContactModel model) async {
    emit(ContactListCubitState.loading());
    await _repository.create(model);
    findAll();
  }
}
