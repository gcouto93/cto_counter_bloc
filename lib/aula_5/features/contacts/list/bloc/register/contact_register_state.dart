part of 'contact_register_bloc.dart';

@freezed
class ContactRegisterState with _$ContactRegisterState {
  factory ContactRegisterState.initial() = _ContactRegisterStateInitial;
  factory ContactRegisterState.loading() = _ContactRegisterStateLoading;
  factory ContactRegisterState.error({required String message}) = _ContactRegisterStateError;
  factory ContactRegisterState.success() = _ContactRegisterStateSuccess;
}
