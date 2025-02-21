part of 'contact_list_cubit.dart';

@freezed
class ContactListCubitState with _$ContactListCubitState {
  factory ContactListCubitState.inital() = _Initial;
  factory ContactListCubitState.loading() = _Loading;
  factory ContactListCubitState.data({required List<ContactModel> contacts}) = _Data;
  factory ContactListCubitState.error({required String message}) = _Error;
}
