part of 'contact_update_bloc.dart';

@freezed
class ContactUpdateState with _$ContactUpdateState {
  factory ContactUpdateState.initial() = _Initial;
  factory ContactUpdateState.loading() = _Loading;
  factory ContactUpdateState.success() = _Success;
  factory ContactUpdateState.error({required String message}) = _Error;
}
