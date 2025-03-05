import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepositories {
  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get('http://localhost:3031/contacts');
    return response.data?.map<ContactModel>((c) => ContactModel.fromJson(c)).toList();
  }

  Future<void> create(ContactModel model) async {
    final response = await Dio().post('http://localhost:3031/contacts', data: model.toJson());
  }

  Future<void> update(ContactModel model) async {
    final response = await Dio().put('http://localhost:3031/contacts/${model.id}', data: model.toJson());
  }

  Future<void> delete(ContactModel model) async {
    final response = await Dio().delete('http://localhost:3031/contacts/${model.id}');
  }
}
