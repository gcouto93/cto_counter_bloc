part of 'contact_update_bloc.dart';

@freezed
abstract class ContactUpdateEvent with _$ContactUpdateEvent {
  factory ContactUpdateEvent.save({required String id, required String name, required String email}) = _Save;
}
