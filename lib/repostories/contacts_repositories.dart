import 'package:cto_counter_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsRepositories {
  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get('http://10.0.2.2:3031/contacts');
    return response.data?.map<ContactModel>((c) => ContactModel.fromJson(c)).toList();
  }

  Future<void> create(ContactModel model) async {}
}
