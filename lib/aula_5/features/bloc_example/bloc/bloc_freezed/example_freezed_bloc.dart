import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_freezed_state.dart';
part 'example_freezed_event.dart';
part 'example_freezed_bloc.freezed.dart';

class ExampleFreezedBloc extends Bloc<ExampleFreezedEvent, ExampleFreezedState> {
  ExampleFreezedBloc() : super(ExampleFreezedState.initial()) {
    on<_ExampleFreezedFindNames>(_findNames);
    on<_ExampleFreezedAddName>(_addName);
    on<_ExampleFreezedRemoveName>(_removeName);
  }

  FutureOr<void> _addName(_ExampleFreezedAddName event, Emitter<ExampleFreezedState> emit) {
    final names = state.maybeWhen(data: (names) => names, orElse: () => const <String>[]);

    emit(ExampleFreezedState.showBanner(names: names, message: 'Aguarde. Nome sendo inserido!!!'));
    Future.delayed(Duration(seconds: 2), () {
      emit(ExampleFreezedState.showBanner(names: names, message: 'Nome inserido com sucesso!!!'));
    });

    final newNames = [...names];
    newNames.add(event.name);

    emit(ExampleFreezedState.data(names: newNames));
  }

  FutureOr<void> _removeName(_ExampleFreezedRemoveName event, Emitter<ExampleFreezedState> emit) {
    final names = state.maybeWhen(data: (names) => names, orElse: () => <String>[]);

    final newNames = [...names];

    newNames.retainWhere((element) => element != event.name);
    emit(ExampleFreezedState.data(names: newNames));
  }

  FutureOr<void> _findNames(_ExampleFreezedFindNames event, Emitter<ExampleFreezedState> emit) async {
    emit(ExampleFreezedState.loading());
    final names = ['Gabriel Couto', 'CTO APPS', 'Flutter', 'Dart', 'Flutter Bloc'];
    await Future.delayed(Duration(seconds: 4));
    emit(ExampleFreezedState.data(names: names));
  }
}
