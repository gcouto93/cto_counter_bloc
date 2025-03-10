import 'package:cto_counter_bloc/aula_mobx/model/full_name.dart';
import 'package:mobx/mobx.dart';

part 'contador_codege_controller.g.dart';

class ContadorCodegeController = _ContadorCodegenControllerBase with _$ContadorCodegeController;

abstract class _ContadorCodegenControllerBase with Store {
  @observable
  int contador = 0;

  @observable
  var fullName = FullName(first: 'first name', last: 'last name');

  @computed
  String get saudacao => 'Ola ${fullName.first} - Voce clicou ${contador} vezes';

  @action
  void incrementar() {
    contador++;
    fullName = fullName.copyWith(first: 'Muleke', last: 'Codeiro');
  }

  @action
  void decrementar() {
    contador--;
  }

  @action
  void changeName() {
    fullName = FullName(first: 'Abel', last: 'Latrel');
  }

  void roolBackName() {
    fullName = fullName.copyWith(first: 'first name', last: 'last name');
  }
}
