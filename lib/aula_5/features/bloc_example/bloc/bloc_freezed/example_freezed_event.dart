part of 'example_freezed_bloc.dart';

@freezed
class ExampleFreezedEvent with _$ExampleFreezedEvent {
  factory ExampleFreezedEvent.findNames() = _ExampleFreezedFindNames;
  factory ExampleFreezedEvent.addName(String name) = _ExampleFreezedAddName;
  factory ExampleFreezedEvent.removeName(String name) = _ExampleFreezedRemoveName;
}
