import 'package:cto_counter_bloc/aula_mobx/model/full_name.dart';
import 'package:mobx/mobx.dart';

class MobxController {
  final _counter = Observable(0);
  var _fullName = Observable<FullName>(FullName(first: 'Maestro', last: 'Santos'));
  late Action increment;

  MobxController() {
    increment = Action(_incrementCounter);
  }

  int get counter => _counter.value;

  void _incrementCounter() {
    _counter.value++;
  }
}
